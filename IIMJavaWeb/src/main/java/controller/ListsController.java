package controller;

import domain.Material;
import domain.Reservation;
import domain.ReservationDetail;
import domain.User;
import java.time.Instant;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import static java.util.stream.Collectors.groupingBy;
import static java.util.stream.Collectors.mapping;
import static java.util.stream.Collectors.toList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.ReservationDao;
import viewmodels.PickupDetailsViewModel;
import viewmodels.ReturnDetailsViewModel;

@Controller
@RequestMapping(value = "/lists*")
public class ListsController {

    @Autowired
    private ReservationDao reservationDao;

    @RequestMapping(value = "/lendOutMaterials", method = RequestMethod.GET)
    public String getLendOutMaterials(@RequestParam(value = "date", required = false) Date date, Model model) {
        if (date == null) {
            date = date = Date.from(Instant.now());;
        }
        final Date pickedDate = date;
        List<Reservation> reservations = reservationDao.findAll();
        Map<Material, List<ReturnDetailsViewModel>> result = reservations.stream()
                .filter(r -> r.getStartDate().before(pickedDate) && r.getEndDate().after(pickedDate))
                .map(r -> r.getReservationDetails())
                .flatMap(rd -> rd.stream())
                .collect(Collectors.groupingBy(ReservationDetail::getMaterial,
                        Collectors.mapping(rd -> createReturnDetailsViewmodel(rd, pickedDate),
                                Collectors.toList())));
        
        model.addAttribute("date",date);
        model.addAttribute("materialDetails", result);

        return "loaned_materials_list";
    }
    
    private ReturnDetailsViewModel createReturnDetailsViewmodel(ReservationDetail rd, Date pickedDate){
        
        
        ReturnDetailsViewModel model = new ReturnDetailsViewModel();
        
        model.setAmount(rd.getAmount());
        model.setBroughtBackDate(rd.getReservation().getBroughtBackDate());
        model.setEndDate(rd.getReservation().getEndDate());
        model.setUser(rd.getReservation().getUser());
        model.setLate((rd.getReservation().getBroughtBackDate() == null && model.getEndDate().before(pickedDate)));
        
        return model;
    }

    @RequestMapping(value = "/pickupList", method = RequestMethod.GET)
    public String getPickupList(@RequestParam(value = "date", required = false) Date date, Model model) {
        if (date == null) {
            date = Date.from(Instant.now());
                    
        }
        
        final Date pickedDate = date;
        
        Map<User, List<PickupDetailsViewModel>> reservations = reservationDao.findAll().stream()
                .filter(r -> r.getStartDate().equals(pickedDate))
                .flatMap(rd -> rd.getReservationDetails().stream())
                .collect(groupingBy(rd -> rd.getReservation().getUser(), 
                        mapping(rd -> new PickupDetailsViewModel(rd.getMaterial().getName(), rd.getAmount()), toList())));
                
        model.addAttribute("date", date);
        model.addAttribute("reservationList", reservations);
        return "pickup_list";
    }
}
