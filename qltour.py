from lxml import etree

# Đọc file XML
tree = etree.parse("qltour.xml")

# 1. Lấy tất cả các tour
c01 = tree.xpath("/QLTour/DSTour/Tour")
print("\n# Lấy tất cả tour")
for tour in c01:
    print(etree.tostring(tour, pretty_print=True, encoding='unicode'))


# 2. Lấy tên tất cả các tour
c02 = tree.xpath("/QLTour/DSTour/Tour/tenTour/text()")
print("\n# 2. Lấy tên tất cả các tour")
for t in c02:
    print(t)


# 3. Lấy tên tour có mã T003
c03 = tree.xpath("/QLTour/DSTour/Tour[@maTour='T003']/tenTour/text()")
print("\n# 3. Lấy tên tour có mã T003")
for t in c03:
    print(t)

# 4. Lấy mô tả tour của tour T002
c04 = tree.xpath("/QLTour/DSTour/Tour[@maTour='T002']/moTa-tour/text()")
print("\n# 4. Lấy mô tả tour của tour T002")
for t in c04:
    print(t)

# 5. Lấy tên hướng dẫn viên của tour T001
c05 = tree.xpath("/QLTour/DSHuongDanVien/HuongDanVien[@maHdv = /QLTour/DSTour/Tour[@maTour='T001']/@maHdv]/tenHuongDanVien/text()")
print("\n# 5. Lấy tên hướng dẫn viên của tour T001")
for t in c05:
    print(t)

# 6. Lấy tất cả tên địa điểm của tour T001
c06 = tree.xpath("/QLTour/DSDiaDiem/DiaDiem[@maDiaDiem = /QLTour/DSTour/Tour[@maTour='T001']/DSDiaDiem-ref/DiaDiem-ref/@maDiaDiem]/tenDiaDiem/text()")
print("\n# 6. Lấy tất cả tên địa điểm của tour T001")
for t in c06:
    print(t)

# 7. Lấy tên khách sạn của tour T002
c07 = tree.xpath("/QLTour/DSKhachSan/KhachSan[@maKS = /QLTour/DSTour/Tour[@maTour='T002']/DSChiTietKhachSan/ChiTietKhachSan/@maKS]/tenKhachSan/text()")
print("\n# 7. Lấy tên khách sạn của tour T002")
for t in c07:
    print(t)

# 8. Lấy tên khách hàng đã đặt tour T001
c08 = tree.xpath("/QLTour/DSKhachHang/KhachHang[@maKhachHang = /QLTour/DSBooking/Booking[@maTour='T001']/@maKhachHang]/tenKhachHang/text()")
print("\n# 8. Lấy tên khách hàng đã đặt tour T001")
for t in c08:
    print(t)

# 9. Lấy tất cả mã tour có giá > 6 triệu
c09 = tree.xpath("/QLTour/DSTour/Tour[giaTour>6000000]/@maTour")
print("\n# 9. Lấy tất cả mã tour có giá > 6 triệu")
for t in c09:
    print(t)

# 10. Lấy tên tour có điểm đánh giá = 5
c10 = tree.xpath("/QLTour/DSTour/Tour[@maTour = /QLTour/DSBooking/Booking[diemDanhGia=5]/@maTour]/tenTour/text()")
print("\n# 10. Lấy tên tour có điểm đánh giá = 5")
for t in c10:
    print(t)

# 11. Lấy số lượng phòng khách sạn của tour T001
c11 = tree.xpath("/QLTour/DSTour/Tour[@maTour='T001']/DSChiTietKhachSan/ChiTietKhachSan/soLuongPhong/text()")
print("\n# 11. Lấy số lượng phòng khách sạn của tour T001")
for t in c11:
    print(t)

# 12. Lấy tên hãng vận chuyển của tour T004
c12 = tree.xpath("/QLTour/DSTour/Tour[@maTour='T004']/DSVanChuyen/VanChuyen/hangVanChuyen/text()")
print("\n# 12. Lấy tên hãng vận chuyển của tour T004")
for t in c12:
    print(t)

# 13. Đếm số lượng tour
c13 = tree.xpath("count(/QLTour/DSTour/Tour)")
print("\n# 13. Đếm số lượng tour")
print(int(c13))

# 14. Đếm số lượng khách hàng đã đặt tour T001
c14 = tree.xpath("count(/QLTour/DSBooking/Booking[@maTour='T001'])")
print("\n# 14. Đếm số lượng khách hàng đã đặt tour T001")
print(int(c14))

# 15. Lấy tên tất cả tour có phương tiện là máy bay
c15 = tree.xpath("/QLTour/DSTour/Tour[DSVanChuyen/VanChuyen[@loaiPhuongTien='Máy_bay']]/tenTour/text()")
print("\n# 15. Lấy tên tất cả tour có phương tiện là máy bay")
for t in c15:
    print(t)

# 16. Lấy tên tất cả hướng dẫn viên biết tiếng Anh
c16 = tree.xpath("/QLTour/DSHuongDanVien/HuongDanVien[ngoaiNgu='Tiếng Anh']/tenHuongDanVien/text()")
print("\n# 16. Lấy tên tất cả hướng dẫn viên biết tiếng Anh")
for t in c16:
    print(t)

# 17. Lấy tên tour có khách sạn ở Hà Nội
c17 = tree.xpath("/QLTour/DSTour/Tour[DSChiTietKhachSan/ChiTietKhachSan/@maKS = /QLTour/DSKhachSan/KhachSan[contains(diaChi-khachSan, 'Hà Nội')]/@maKS]/tenTour/text()")
print("\n# 17. Lấy tên tour có khách sạn ở Hà Nội")
for t in c17:
    print(t)

# 18. Lấy tên tour có địa điểm là Vịnh Hạ Long
c18 = tree.xpath("/QLTour/DSTour/Tour[DSDiaDiem-ref/DiaDiem-ref/@maDiaDiem = /QLTour/DSDiaDiem/DiaDiem[tenDiaDiem='Vịnh Hạ Long']/@maDiaDiem]/tenTour/text()")
print("\n# 18. Lấy tên tour có địa điểm là Vịnh Hạ Long")
for t in c18:
    print(t)

# 19. Lấy tên khách hàng đã đánh giá tour T002
c19 = tree.xpath("/QLTour/DSKhachHang/KhachHang[@maKhachHang = /QLTour/DSBooking/Booking[@maTour='T002' and diemDanhGia]/@maKhachHang]/tenKhachHang/text()")
print("\n# 19. Lấy tên khách hàng đã đánh giá tour T002")
for t in c19:
    print(t)

# 20. Lấy tên tour + tên hướng dẫn viên của tour T005 (dùng concat)
c20 = tree.xpath("concat(/QLTour/DSTour/Tour[@maTour='T005']/tenTour, ' - ', /QLTour/DSHuongDanVien/HuongDanVien[@maHdv = /QLTour/DSTour/Tour[@maTour='T005']/@maHdv]/tenHuongDanVien)")
print("\n# 20. Lấy tên tour + tên hướng dẫn viên của tour T005")
print(c20)