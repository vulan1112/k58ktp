CREATE TABLE MonHoc (
    MaMon INT PRIMARY KEY,
    TenMon VARCHAR(100),
    STC INT CHECK (STC > 0)
);
Go