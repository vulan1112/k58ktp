SELECT
    sv.MaSV,
    sv.HoTen,
    lhp.TenLopHP,
    mh.TenMon,
    lhp.HK,
    SUM(d.Diem) AS TongDiem, -- Tổng điểm
    (SUM(d.Diem) * (1 - COALESCE(dkmh.PhanTramThi, 0) / 100.0)) AS DiemThanhPhan
FROM SinhVien sv
JOIN DKMH dkmh ON sv.MaSV = dkmh.MaSV
JOIN LopHP lhp ON dkmh.MaLopHP = lhp.MaLopHP
JOIN MonHoc mh ON lhp.MaMon = mh.MaMon
JOIN Diem d ON dkmh.id_dk = d.id_dk
GROUP BY sv.MaSV, sv.HoTen, lhp.TenLopHP, mh.TenMon, lhp.HK, dkmh.PhanTramThi;
