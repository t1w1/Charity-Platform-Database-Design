--=============View Create=============--

--view1--
--This view shows details of donor's donation 
CREATE VIEW vwDonorDonation AS SELECT dr.FirstName, dr.LastName, temp.ItemName, temp.Quantity, temp.DonationTime
From Donor dr
Join 
(SELECT dn.ItemID as id, dn.Quantity, dn.DonationTime, dn.DonorID, it.ItemID, it.ItemName
From Donation dn
Join Item it
On it.ItemID = dn.ItemID
) temp
On dr.DonorID = temp.DonorID;

GO
--Execute the following line to see the Donation View
--SELECT * FROM vwDonorDonation;

--view2--
--This view shows all aspect about doctor's demand 
CREATE VIEW vwDoctorsDemand AS SELECT doc.FirstName as Doctor_FN, doc.LastName as Doctor_LN, temp1.ItemName, temp1.Quantity, temp1.CreateTime, temp1.Status,
temp1.DFN as Driver_FN, temp1.DLN as Driver_LN
From Doctor doc
Join 
 (Select dr.DoctorID, dr.ItemName, dr.Quantity, dr.CreateTime, dr.Status, dr.ItemID as ITid, temp2.ItemID, temp2.DriverID, temp2.FirstName as DFN, temp2.LastName as DLN
 From Demand_Record dr
 Join(
  Select tr.DriverID as Did, tr.ItemID, der.DriverID, der.FirstName, der.LastName
  From Transform_Record tr
  Join Driver der
  On der.DriverID = tr.DriverID
  )temp2
 On dr.ItemID = temp2.ItemID
 ) temp1
On doc.DoctorID = temp1.DoctorID;

GO
--Execute the following line to see the Doctor's Demand View
--SELECT * FROM vwDoctorsDemandNew;