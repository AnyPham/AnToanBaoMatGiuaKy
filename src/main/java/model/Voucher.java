package model;

import java.time.LocalDateTime;
import java.util.Date;

public class Voucher {
    private int id;
    private String voucher_name;
    private String type;
    private LocalDateTime start_date;
    private LocalDateTime end_date;
    private String note;
    private double percent_decrease;
    private int price_decrease;

    public Voucher(int id, String voucher_name, String type, LocalDateTime start_date, LocalDateTime end_date, String note, double percent_decrease, int price_decrease) {
        this.id = id;
        this.voucher_name = voucher_name;
        this.type = type;
        this.start_date = start_date;
        this.end_date = end_date;
        this.note = note;
        this.percent_decrease = percent_decrease;
        this.price_decrease = price_decrease;
    }

    @Override
    public String toString() {
        return "Voucher{" +
                "id=" + id +
                ", voucher_name='" + voucher_name + '\'' +
                ", type='" + type + '\'' +
                ", start_date=" + start_date +
                ", end_date=" + end_date +
                ", note='" + note + '\'' +
                ", percent_decrease=" + percent_decrease +
                ", price_decrease=" + price_decrease +
                '}';
    }

    public Voucher() {
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setVoucher_name(String voucher_name) {
        this.voucher_name = voucher_name;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setStart_date(LocalDateTime start_date) {
        this.start_date = start_date;
    }

    public void setEnd_date(LocalDateTime end_date) {
        this.end_date = end_date;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public void setPercent_decrease(double percent_decrease) {
        this.percent_decrease = percent_decrease;
    }

    public void setPrice_decrease(int price_decrease) {
        this.price_decrease = price_decrease;
    }

    public int getId() {
        return id;
    }

    public String getVoucher_name() {
        return voucher_name;
    }

    public String getType() {
        return type;
    }

    public LocalDateTime getStart_date() {
        return start_date;
    }

    public LocalDateTime getEnd_date() {
        return end_date;
    }

    public String getNote() {
        return note;
    }

    public double getPercent_decrease() {
        return percent_decrease;
    }

    public int getPrice_decrease() {
        return price_decrease;
    }
}
