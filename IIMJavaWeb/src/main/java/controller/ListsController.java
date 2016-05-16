package controller;

import domain.Material;
import domain.Reservation;
import domain.ReservationDetail;
import domain.User;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import static java.util.stream.Collectors.groupingBy;
import static java.util.stream.Collectors.mapping;
import static java.util.stream.Collectors.toList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.ReservationDao;
import viewmodels.PickupDetailsViewModel;
import viewmodels.ReturnDetailsViewModel;

@Controller
@RequestMapping(value = "/lists*")
public class ListsController {

    @Autowired
    private ReservationDao reservationDao;


    @RequestMapping(value = "/lendOutMaterials")
    public String getLendOutMaterials(@RequestParam(value = "date", required = false) String date, Model model) {
        final LocalDate pickedDate = date == null ? LocalDate.now() : LocalDate.parse(date);
        List<Reservation> reservations = reservationDao.findAll();
        Map<Material, List<ReturnDetailsViewModel>> result = reservations.stream()
                .filter(r
                        -> (r.getLocalStartDate().isBefore(pickedDate) || r.getLocalStartDate().isEqual(pickedDate))
                        && (r.getLocalEndDate().isAfter(pickedDate) || r.getLocalEndDate().isEqual(pickedDate)))
                .flatMap(rd -> rd.getReservationDetails().stream())
                .collect(groupingBy(ReservationDetail::getMaterial, mapping(rd -> createReturnDetailsViewmodel(rd), toList())));

        model.addAttribute("date", date);
        model.addAttribute("materialDetails", result);

        return "loaned_materials_list";
    }

    private ReturnDetailsViewModel createReturnDetailsViewmodel(ReservationDetail rd) {

        ReturnDetailsViewModel model = new ReturnDetailsViewModel();

        model.setAmount(rd.getAmount());
        model.setBroughtBackDate(rd.getReservation().getLocalBroughtBackDate());
        model.setEndDate(rd.getReservation().getLocalEndDate());
        model.setUser(rd.getReservation().getUser());
        model.setLate((rd.getReservation().getBroughtBackDate() == null && model.getEndDate().isBefore(LocalDate.now())));

        return model;
    }


    @RequestMapping(value = "/pickupList")
    public String getPickupList(@RequestParam(value = "date", required = false) String date, Model model) {
        final LocalDate pickedDate = date == null ? LocalDate.now() : LocalDate.parse(date);
        Map<User, List<PickupDetailsViewModel>> reservations = reservationDao.findAll().stream()
                .filter(r -> r.getLocalStartDate().isEqual(pickedDate))
                .flatMap(rd -> rd.getReservationDetails().stream())
                .collect(groupingBy(rd -> rd.getReservation().getUser(),
                        mapping(rd -> new PickupDetailsViewModel(rd.getMaterial().getName(), rd.getAmount()), toList())));

        model.addAttribute("date", date);
        model.addAttribute("reservationList", reservations);
        return "pickup_list";
    }
}
