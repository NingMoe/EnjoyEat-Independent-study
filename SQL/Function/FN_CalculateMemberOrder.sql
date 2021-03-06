-- =============================================
-- Author:		George Liu
-- Create date: 2015/10/27
-- Description:	計算會員點餐單金額
-- Parameter:
--			@intReservation_ID 訂位單編號
--			@@intMember_ID 會員編號
-- =============================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID(N'dbo.FN_CalculateMemberOrder', N'FN') IS NOT NULL
DROP FUNCTION dbo.FN_CalculateMemberOrder
GO
CREATE FUNCTION [dbo].[FN_CalculateMemberOrder]
( @intReservation_ID AS int ,
  @intMember_ID AS int 
)
RETURNS int
AS
BEGIN

DECLARE @intTotal INT;
DECLARE @intCount INT;
SET @intTotal = 0
SELECT
	@intCount = COUNT(0)
FROM Orderdetail AS OD
WHERE OD.Member_ID = @intMember_ID
AND OD.Reservation_ID = @intReservation_ID;

IF @intCount > 0 SELECT
	@intTotal = @intTotal + Orderdetail_Quantity * Meal_Price
FROM Orderdetail AS OD
INNER JOIN Meal
	ON OD.Meal_ID = Meal.Meal_ID
WHERE OD.Member_ID = @intMember_ID
AND OD.Reservation_ID = @intReservation_ID;

RETURN @intTotal
END