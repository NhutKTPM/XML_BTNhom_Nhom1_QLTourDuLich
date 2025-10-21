<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output method="html" encoding="UTF-8" indent="yes"/>

<!-- Gốc -->
<xsl:template match="/QLTour">
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

<!-- 1. Lấy tất cả các tour -->
<h2>1. Danh sách tất cả tour</h2>
<table>
<tr><th>Mã Tour</th><th>Tên Tour</th><th>Giá</th></tr>
<xsl:for-each select="DSTour/Tour">
<tr>
    <td><xsl:value-of select="@maTour"/></td>
    <td><xsl:value-of select="tenTour"/></td>
    <td><xsl:value-of select="giaTour"/></td>
</tr>
</xsl:for-each>
</table>

<!-- 2. Lấy tên tất cả các tour -->
<h2>2. Tên tất cả các tour</h2>
<ul>
<xsl:for-each select="DSTour/Tour">
    <li><xsl:value-of select="tenTour"/></li>
</xsl:for-each>
</ul>

<!-- 3. Lấy tên tour có mã T003 -->
<h2>3. Tên tour có mã T003</h2>
<p><xsl:value-of select="DSTour/Tour[@maTour='T003']/tenTour"/></p>

<!-- 4. Lấy mô tả tour của tour T002 -->
<h2>4. Mô tả tour của tour T002</h2>
<p><xsl:value-of select="DSTour/Tour[@maTour='T002']/moTa-tour"/></p>

<!-- 5. Tên hướng dẫn viên của tour T001 -->
<h2>5. Hướng dẫn viên tour T001</h2>
<p>
<xsl:value-of select="DSHuongDanVien/HuongDanVien[@maHdv = /QLTour/DSTour/Tour[@maTour='T001']/@maHdv]/tenHuongDanVien"/>
</p>

<!-- 6. Tên địa điểm của tour T001 -->
<h2>6. Địa điểm của tour T001</h2>
<ul>
<xsl:for-each select="DSDiaDiem/DiaDiem[@maDiaDiem = /QLTour/DSTour/Tour[@maTour='T001']/DSDiaDiem-ref/DiaDiem-ref/@maDiaDiem]">
    <li><xsl:value-of select="tenDiaDiem"/></li>
</xsl:for-each>
</ul>

<!-- 7. Tên khách sạn của tour T002 -->
<h2>7. Khách sạn của tour T002</h2>
<p>
<xsl:value-of select="DSKhachSan/KhachSan[@maKS = /QLTour/DSTour/Tour[@maTour='T002']/DSChiTietKhachSan/ChiTietKhachSan/@maKS]/tenKhachSan"/>
</p>

<!-- 8. Khách hàng đã đặt tour T001 -->
<h2>8. Khách hàng đã đặt tour T001</h2>
<ul>
<xsl:for-each select="DSKhachHang/KhachHang[@maKhachHang = /QLTour/DSBooking/Booking[@maTour='T001']/@maKhachHang]">
    <li><xsl:value-of select="tenKhachHang"/></li>
</xsl:for-each>
</ul>

<!-- 9. Tất cả mã tour có giá > 6 triệu -->
<h2>9. Mã tour có giá &gt; 6 triệu</h2>
<ul>
<xsl:for-each select="DSTour/Tour[giaTour>6000000]">
    <li><xsl:value-of select="@maTour"/></li>
</xsl:for-each>
</ul>

<!-- 10. Tên tour có điểm đánh giá = 5 -->
<h2>10. Tour có điểm đánh giá = 5</h2>
<ul>
<xsl:for-each select="DSTour/Tour[@maTour = /QLTour/DSBooking/Booking[diemDanhGia=5]/@maTour]">
    <li><xsl:value-of select="tenTour"/></li>
</xsl:for-each>
</ul>

<!-- 13. Đếm số lượng tour -->
<h2>13. Số lượng tour</h2>
<p><xsl:value-of select="count(DSTour/Tour)"/></p>

<!-- 15. Tên tour có phương tiện là máy bay -->
<h2>15. Tour có phương tiện là Máy bay</h2>
<ul>
<xsl:for-each select="DSTour/Tour[DSVanChuyen/VanChuyen[@loaiPhuongTien='Máy_bay']]">
    <li><xsl:value-of select="tenTour"/></li>
</xsl:for-each>
</ul>

<!-- 16. Hướng dẫn viên biết tiếng Anh -->
<h2>16. Hướng dẫn viên biết tiếng Anh</h2>
<ul>
<xsl:for-each select="DSHuongDanVien/HuongDanVien[ngoaiNgu='Tiếng Anh']">
    <li><xsl:value-of select="tenHuongDanVien"/></li>
</xsl:for-each>
</ul>

<!-- 20. Tour T005 + Hướng dẫn viên -->
<h2>20. Tour T005 và hướng dẫn viên phụ trách</h2>
<p>
<xsl:value-of select="concat(DSTour/Tour[@maTour='T005']/tenTour, ' - ', DSHuongDanVien/HuongDanVien[@maHdv = /QLTour/DSTour/Tour[@maTour='T005']/@maHdv]/tenHuongDanVien)"/>
</p>

</body>
</html>
</xsl:template>

</xsl:stylesheet>
