-- BÀI TẬP ÔN TẬP SQL
-- Bài quản lý sản phẩm
use demo2006;
-- 6. In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 19/6/2006 và ngày 20/6/2006.
select odd.orderId, sum(odd.quantity * pr.price) as value_order 
from demo2006.order od, demo2006.orderdetail odd, demo2006.product pr 
where pr.id = odd.productId and od.id = odd.orderId and 
od.time >= '2006/06/19 00:00:00' and od.time <='2006/06/20 00:00:00'
group by odd.orderId;

-- 7. In ra các số hóa đơn, trị giá hóa đơn trong tháng 6/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).
select odd.orderId, sum(odd.quantity * pr.price) as value_order
from demo2006.order od, demo2006.orderdetail odd, demo2006.product pr
where pr.id = odd.productId and od.id = odd.orderId and
od.time between '2007/06/1 00:00:00' and '2007/06/30 00:00:00'
order by od.time asc, value_order desc;

-- 8. In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 19/06/2007.
select od.customerId as MAKH, cus.name as HOTEN
from demo2006.customer cus, demo2006.order od
where od.customerId = cus.id and
od.time between '2007/06/19 00:00:00' and '2007/06/20 00:00:00';

-- 10. In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.

select pr.id, pr.name, cus.name, od.time
from demo2006.customer cus, demo2006.product pr, demo2006.order od, demo2006.orderdetail odd
where pr.id = odd.productId and odd.orderId = od.id and cus.id = od.customerId
and cus.name = 'Nguyen Van A' and od.time >= '2006/10/01' and od.time <='2006/10/30'
group by pr.id, pr.name;

-- 11. Tìm các số hóa đơn đã mua sản phẩm “Máy giặt” hoặc “Tủ lạnh”.
-- 12. Tìm các số hóa đơn đã mua sản phẩm “Máy giặt” hoặc “Tủ lạnh”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
-- 13. Tìm các số hóa đơn mua cùng lúc 2 sản phẩm “Máy giặt” và “Tủ lạnh”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
-- 15. In ra danh sách các sản phẩm (MASP,TENSP) không bán được.
-- 16. In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.
-- 17. In ra danh sách các sản phẩm (MASP,TENSP) có giá >300 sản xuất bán được trong năm 2006.
-- 18. Tìm số hóa đơn đã mua tất cả các sản phẩm có giá >200.
-- 19. Tìm số hóa đơn trong năm 2006 đã mua tất cả các sản phẩm có giá <300.
-- 21. Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
-- 22. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu?
-- 23. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
-- 24. Tính doanh thu bán hàng trong năm 2006.
-- 25. Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
-- 26. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
-- 27. In ra danh sách 3 khách hàng (MAKH, HOTEN) mua nhiều hàng nhất (tính theo số lượng).
-- 28. In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
-- 29. In ra danh sách các sản phẩm (MASP, TENSP) có tên bắt đầu bằng chữ M, có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).
-- 32. Tính tổng số sản phẩm giá <300.
-- 33. Tính tổng số sản phẩm theo từng giá.
-- 34. Tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm bắt đầu bằng chữ M.
-- 35. Tính doanh thu bán hàng mỗi ngày.
-- 36. Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
-- 37. Tính doanh thu bán hàng của từng tháng trong năm 2006.
-- 38. Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
-- 39. Tìm hóa đơn có mua 3 sản phẩm có giá <300 (3 sản phẩm khác nhau).
-- 40. Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.
-- 41. Tháng mấy trong năm 2006, doanh số bán hàng cao nhất?
-- 42. Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
-- 45. Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.