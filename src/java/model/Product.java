/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package model;

import java.text.NumberFormat;
import java.util.Locale;

/**
 *
 * @author NGHIA
 */
public class Product {
    private int maSP;
    private String tenSP;
    private String moTa;
    private double donGia;
    private String hinh;
    private String maLoai;

    public Product(int maSP, String tenSP, String moTa, double donGia, String hinh, String maLoai) {
        this.maSP = maSP;
        this.tenSP = tenSP;
        this.moTa = moTa;
        this.donGia = donGia;
        this.hinh = hinh;
        this.maLoai = maLoai;
    }

    public int getMaSP() {
        return maSP;
    }

    public void setMaSP(int maSP) {
        this.maSP = maSP;
    }

    public String getTenSP() {
        return tenSP;
    }

    public void setTenSP(String tenSP) {
        this.tenSP = tenSP;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public double getDonGia() {
        return donGia;
    }

    public void setDonGia(double donGia) {
        this.donGia = donGia;
    }

    public String getHinh() {
        return hinh;
    }

    public void setHinh(String hinh) {
        this.hinh = hinh;
    }

    public String getMaLoai() {
        return maLoai;
    }

    public void setMaLoai(String maLoai) {
        this.maLoai = maLoai;
    }
    
    // Phương thức định dạng giá tiền
    public String getFormattedDonGia() {
        NumberFormat formatter = NumberFormat.getInstance(new Locale("vi", "VN"));
        return formatter.format(donGia) + " đ";
    }
    // Phương thức tính toán và định dạng tổng tiền
    public String getFormattedTotalPrice(int quantity) {
        double totalPrice = quantity * donGia;
        NumberFormat formatter = NumberFormat.getInstance(new Locale("vi", "VN"));
        return formatter.format(totalPrice) + " đ";
    }
}
