package controller;

import domain.Material;
import domain.Reservation;
import domain.ReservationDetail;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.ReservationDao;
import viewmodels.ReturnDetailsViewModel;

@Controller
@RequestMapping(value = "/lists*")
public class ListsController {

    @Autowired
    private ReservationDao reservationDao;

    @RequestMapping(value = "/lendOutMaterials", method = RequestMethod.GET)
    public String getLendOutMaterials(@RequestParam(value = "date", required = false) LocalDateTime date, Model model) {
        if (date == null) {
            date = LocalDateTime.now();
        }
        final LocalDateTime pickedDate = date;
        List<Reservation> reservations = reservationDao.findAll();
        Map<Material, List<ReturnDetailsViewModel>> result = reservations.stream()
                .filter(r -> r.getStartDate().isBefore(pickedDate) && r.getEndDate().isAfter(pickedDate))
                .map(r -> r.getReservationDetails())
                .flatMap(rd -> rd.stream())
                .collect(Collectors.groupingBy(ReservationDetail::getMaterial,
                        Collectors.mapping(rd -> createReturnDetailsViewmodel(rd, pickedDate),
                                Collectors.toList())));

        
        model.addAttribute("materialDetails", result);

        return "loaned_materials_list";
    }
    
    private ReturnDetailsViewModel createReturnDetailsViewmodel(ReservationDetail rd, LocalDateTime pickedDate){
        
        
        ReturnDetailsViewModel model = new ReturnDetailsViewModel();
        
        model.setAmount(rd.getAmount());
        model.setBroughtBackDate(rd.getReservation().getBroughtBackDate());
        model.setEndDate(rd.getReservation().getEndDate());
        model.setUser(rd.getReservation().getUser());
        model.setLate((rd.getReservation().getBroughtBackDate() != null && model.getEndDate().isBefore(pickedDate)));
        
        return model;
    }

    @RequestMapping(value = "/bringbackmaterials", method = RequestMethod.GET)
    public String bringMaterialsToday(Model model) {

        //<editor-fold  defaultstate="collapsed" desc="Volgende vrijdag berekenen">
        GregorianCalendar date = new GregorianCalendar(LocalDate.now().getYear(), LocalDate.now().getMonthValue() - 1, LocalDate.now().getDayOfMonth());
        while (date.get(Calendar.DAY_OF_WEEK) != Calendar.FRIDAY) {
            date.add(Calendar.DATE, 1);
        }
//</editor-fold>

        model.addAttribute("reservation", new Reservation());
        List<Reservation> reservations = reservationDao.findAll();
        List<Reservation> listForToday = new ArrayList<>();
        for (Reservation r : reservations) {
            //Date.valueOf(LocalDate.now())
            if (r.getEndDate().equals(date.getTime())) {
                listForToday.add(r);
            }
        }

        model.addAttribute("date", date.getTime());
        model.addAttribute("reservationList", listForToday);

        return "pickupList";
    }

}
