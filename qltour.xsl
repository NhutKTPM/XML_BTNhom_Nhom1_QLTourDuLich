<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output method="html" encoding="UTF-8" indent="yes"/>

<!-- Gốc -->
<xsl:template match="/">
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Kết quả truy vấn QLTour</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f9f9f9; }
        h2 { background: #384289; color: white; padding: 6px; border-radius: 5px; }
        table { border-collapse: collapse; width: 90%; margin: 20px auto; background: white; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: center; }
        th { background: #f0f0f0; }
        h1 { text-align: center; margin-top: 20px; }
    </style>
</head>
<body>
<h1 style="text-align:center;">KẾT QUẢ CÁC TRUY VẤN TỪ QLTOUR.XML</h1>

<!-- Lấy tất cả các tour -->
<h2>Danh sách tất cả tour, sắp xếp theo ngày bắt đầu tăng dần</h2>
<table>
<tr>
    <th>Mã Tour</th>
    <th>Tên Tour</th>
    <th>Ngày bắt đầu</th>
    <th>Ngày kết thúc</th>
    <th>Giá</th></tr>
<xsl:for-each select="QLTour/DSTour/Tour">
    <xsl:sort select="ngayBatDau" order="ascending"/>
<tr>
    <td><xsl:value-of select="@maTour"/></td>
    <td><xsl:value-of select="tenTour"/></td>
    <td><xsl:value-of select="ngayBatDau"/></td>
    <td><xsl:value-of select="ngayKetThuc"/></td>
    <td><xsl:value-of select="giaTour"/></td>
</tr>
</xsl:for-each>
</table>



<!-- Lấy thông tin tour có mã T003 -->
<h2>Thông tin tour có mã T003, bao gồm tên hướng dẫn viên</h2>
<table>
<tr>
    <th>Mã Tour</th>
    <th>Tên Tour</th>
    <th>Ngày bắt đầu</th>
    <th>Ngày kết thúc</th>
    <th>Giá</th>
    <th>Tên hướng dẫn viên</th>
</tr>
<xsl:for-each select="QLTour/DSTour/Tour[@maTour='T003']">
<tr>
    <td><xsl:value-of select="@maTour"/></td>
    <td><xsl:value-of select="tenTour"/></td>
    <td><xsl:value-of select="ngayBatDau"/></td>
    <td><xsl:value-of select="ngayKetThuc"/></td>
    <td><xsl:value-of select="giaTour"/></td>
    <td><xsl:value-of select="/QLTour/DSHuongDanVien/HuongDanVien[@maHdv = current()/@maHdv]/tenHuongDanVien"/></td>
</tr>
</xsl:for-each>
</table>

<!-- Địa điểm trong tour T003 -->
<h2>Địa điểm tham quan trong tour T003</h2>
<table>
    <tr>
        <th>Mã địa điểm</th>
        <th>Tên địa điểm</th>
        <th>Địa chỉ</th>
    </tr>
<xsl:for-each select="QLTour/DSDiaDiem/DiaDiem[@maDiaDiem = /QLTour/DSTour/Tour[@maTour='T003']/DSDiaDiem-ref/DiaDiem-ref/@maDiaDiem]">
    <tr>
        <td><xsl:value-of select="@maDiaDiem"/></td>
        <td><xsl:value-of select="tenDiaDiem"/></td>
        <td><xsl:value-of select="diaChi-diaDiem"/></td>
    </tr>
</xsl:for-each>
</table>


<!-- Tất cả mã tour có giá > 6 triệu -->
<h2>9. Mã tour có giá &gt; 6 triệu</h2>
<table>
<tr>
    <th>Mã Tour</th>
    <th>Tên Tour</th>
    <th>Ngày bắt đầu</th>
    <th>Ngày kết thúc</th>
    <th>Giá</th></tr>
<xsl:for-each select="QLTour/DSTour/Tour[giaTour>6000000]">
<tr>
    <td><xsl:value-of select="@maTour"/></td>
    <td><xsl:value-of select="tenTour"/></td>
    <td><xsl:value-of select="ngayBatDau"/></td>
    <td><xsl:value-of select="ngayKetThuc"/></td>
    <td><xsl:value-of select="giaTour"/></td>
</tr>
</xsl:for-each>
</table>


<!-- Khách hàng đã đặt tour T001 -->
<h2>8. Khách hàng đã đặt tour T001</h2>
<table>
<tr>
    <th>Mã Khách Hàng</th>
    <th>Tên Khách Hàng</th>
    <th>Số Điện Thoại</th>
    <th>Email</th>
</tr>
<xsl:for-each select="QLTour/DSKhachHang/KhachHang[@maKhachHang = /QLTour/DSBooking/Booking[@maTour='T001']/@maKhachHang]">
<tr>
    <td><xsl:value-of select="@maKhachHang"/></td>
    <td><xsl:value-of select="tenKhachHang"/></td>
    <td><xsl:value-of select="soDienThoai"/></td>
    <td><xsl:value-of select="email"/></td>
</tr>
</xsl:for-each>
</table>




<!-- Danh sách các đánh giá của Tour T001 -->
<h2>Danh sách đánh giá của tour T001</h2>
<table>
<tr>
    <th>Mã Booking</th>
    <th>Tên khách Hàng</th>
    <th>Điểm Đánh Giá</th>
    <th>Nội Dung Đánh Giá</th>
</tr>
<xsl:for-each select="QLTour/DSBooking/Booking[@maTour='T001' and diemDanhGia]">
<tr>
    <td><xsl:value-of select="@maBooking"/></td>
    <td><xsl:value-of select="/QLTour/DSKhachHang/KhachHang[@maKhachHang=current()/@maKhachHang]/tenKhachHang"/></td>
    <td><xsl:value-of select="diemDanhGia"/></td>
    <td><xsl:value-of select="noiDungDanhGia"/></td>
</tr>
</xsl:for-each>
</table>


<!-- Đếm số lượng booking của tour T001 -->
<h2>14. Số lượng booking của tour T001</h2>
<p><xsl:value-of select="count(QLTour/DSBooking/Booking[@maTour='T001'])"/></p>


<!-- Các tour đã được đặt nhiều hơn một lần -->
<h2>Các tour đã được đặt nhiều hơn một lần</h2>
<table>
    <tr>
        <th>Mã Tour</th>
        <th>Tên Tour</th>
        <th>Tổng số booking</th>
    </tr>
    <xsl:for-each select="QLTour/DSTour/Tour">
        <xsl:variable name="varMaTour" select="@maTour"/>
        <xsl:variable name="tongBooking" select="count(/QLTour/DSBooking/Booking[@maTour=$varMaTour])"/>
        <xsl:if test="$tongBooking &gt; 1">
            <tr>
                <td><xsl:value-of select="@maTour"/></td>
                <td><xsl:value-of select="tenTour"/></td>
                <td><xsl:value-of select="$tongBooking"/></td>
            </tr>
        </xsl:if>
    </xsl:for-each>
</table>

<!-- Tổng tiền của Booking B001 -->
<h2>Tổng tiền của Booking B001</h2>
<p>
    <xsl:for-each select="QLTour/DSBooking/Booking[@maBooking='B001']">
    <xsl:value-of select="count(current()/DSChiTietBooking/ChiTietBooking) * /QLTour/DSTour/Tour[@maTour=current()/@maTour]/giaTour"/>
    </xsl:for-each>
</p>

</body>
</html>
</xsl:template>

</xsl:stylesheet>
