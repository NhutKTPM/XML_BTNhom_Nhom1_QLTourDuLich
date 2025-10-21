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