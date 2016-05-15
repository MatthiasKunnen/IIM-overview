/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import domain.Reservation;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.ReservationDao;

/**
 *
 * @author matthiasseghers
 */
@Controller
@RequestMapping(value = "/lists")
public class ListsController {

    @Autowired
    private ReservationDao reservationDao;

    @RequestMapping(value = "/pickupmaterials", method = RequestMethod.GET)
    public String pickupMaterialsToday(Model model) {

        //<editor-fold  defaultstate="collapsed" desc="Volgende maandag berekenen">
        GregorianCalendar date = new GregorianCalendar(LocalDate.now().getYear(), LocalDate.now().getMonthValue() - 1, LocalDate.now().getDayOfMonth());
        while (date.get(Calendar.DAY_OF_WEEK) != Calendar.MONDAY) {
            date.add(Calendar.DATE, 1);
        }
//</editor-fold>

        model.addAttribute("reservation", new Reservation());
        List<Reservation> reservations = reservationDao.findAll();
        List<Reservation> listForToday = new ArrayList<>();
        for (Reservation r : reservations) {
            //Date.valueOf(LocalDate.now())
            if (r.getStartDate()
                    .equals(date.getTime())) {
                listForToday.add(r);
            }
        }

        model.addAttribute("date", date.getTime());
        model.addAttribute("reservationList", listForToday);

        return "pickupList";
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
