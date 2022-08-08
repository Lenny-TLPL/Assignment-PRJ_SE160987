/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.utils;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 *
 * @author Phi Long
 */
public class DateUtils {

    public static boolean inputValidDate(String date) throws ParseException {
        boolean cont = true;
        String PATTERN = "\\d{4}-\\d{2}-\\d{2}";
        int day = 0;
        int month = 0;
        int year = 0;
        int maxd = 31;
        if (date.matches(PATTERN)) {
            String[] time = date.split("-");
            day = Integer.parseInt(time[2]);
            month = Integer.parseInt(time[1]);
            year = Integer.parseInt(time[0]);
            if (month == 4 || month == 6 || month == 9 || month == 11) {
                maxd = 30;
            } else if (month == 2) {
                if (year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)) {
                    maxd = 29;
                } else {
                    maxd = 28;
                }
            }
            if (day <= maxd) {
                cont = true;
            } else {
                cont = false;
            }
        } else {
            cont = false;
        }
        return cont;
    }
    public static boolean checkDateAfter(String importDateS, String usingDateS) throws ParseException{
        Date importDate = new SimpleDateFormat("yyyy-MM-dd").parse(importDateS);
        Date usingDate= new SimpleDateFormat("yyyy-MM-dd").parse(usingDateS);
        boolean check=importDate.after(usingDate);
        return check;
    }
}
