package utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {
    public static Date convertStringToDate(String dateString)
            throws ParseException {
        SimpleDateFormat formatter = new SimpleDateFormat("dd/mm/yyyy");
        Date date = formatter.parse(dateString);
        return date;
    }
    public static java.sql.Date convertJavaDateToSqlDate(Date javaDate) {
        java.sql.Date sqlDate = new java.sql.Date(javaDate.getTime());
        return sqlDate;
    }
}