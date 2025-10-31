from lxml import etree

# Đọc file XML
tree = etree.parse("qltour.xml")

# 1. Lấy tất cả các tour
c01 = tree.xpath("/QLTour/DSTour/Tour")
print("\n# 1. Lấy tất cả tour")
for tour in c01:
    print(etree.tostring(tour, pretty_print=True, encoding='unicode'))


# 2. Lấy thông tin tour có mã T003
c02 = tree.xpath("/QLTour/DSTour/Tour[@maTour='T003']")
print("\n# 2. Lấy thông tin tour có mã T003")
for t in c02:
    print(etree.tostring(t, pretty_print=True, encoding='unicode'))

# 3. Lấy tên các khách hàng đã đặt tour T001
c03 = tree.xpath("/QLTour/DSKhachHang/KhachHang[@maKhachHang = /QLTour/DSBooking/Booking[@maTour='T001']/@maKhachHang]/tenKhachHang/text()")
print("\n# 3. Lấy tên các khách hàng đã đặt tour T001")
for t in c03:
    print(t)

# 4. Lấy tất cả mã tour có giá > 6 triệu
c04 = tree.xpath("/QLTour/DSTour/Tour[giaTour>6000000]/@maTour")
print("\n# 4. Lấy tất cả mã tour có giá > 6 triệu")
for t in c04:
    print(t)

# 5. Đếm số lượng khách hàng đã đặt tour T001
c05 = tree.xpath("count(/QLTour/DSBooking/Booking[@maTour='T001'])")
print("\n# 5. Đếm số lượng khách hàng đã đặt tour T001")
print(int(c05))

# 6. Lấy số điểm đánh giá trung bình của tour T001
c06 = tree.xpath("sum ( /QLTour/DSBooking/Booking[@maTour='T001' and diemDanhGia]/diemDanhGia) div count(/QLTour/DSBooking/Booking[@maTour='T001' and diemDanhGia]/diemDanhGia)")
print("\n# 6. Lấy số điểm đánh giá trung bình của tour T001")
print(c06)

# 7. Lấy tên tour + tên hướng dẫn viên của tour T005 (dùng concat)
c07 = tree.xpath("concat(/QLTour/DSTour/Tour[@maTour='T005']/tenTour, ' - ', /QLTour/DSHuongDanVien/HuongDanVien[@maHdv = /QLTour/DSTour/Tour[@maTour='T005']/@maHdv]/tenHuongDanVien)")
print("\n# 7. Lấy tên tour + tên hướng dẫn viên của tour T005")
print(c07)