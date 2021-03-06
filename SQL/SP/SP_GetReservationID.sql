SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		George Liu
-- Create date: 2015/10/27
-- Description:	取得訂位編號
-- Parameter:
--			@intRestaurant_ID 訂位餐廳編號
--			@intMember_ID 會員編號
-- OutPut:
--			@outReservation_ID 訂位單編號
-- =============================================
IF OBJECT_ID(N'dbo.SP_GetReservationID', 'p') IS NOT NULL
DROP PROCEDURE dbo.SP_GetReservationID
GO
CREATE PROCEDURE [dbo].[SP_GetReservationID]
	@intRestaurant_ID AS int,
	@intMember_ID AS int,
	@outReservation_ID AS int OUTPUT
AS
BEGIN

SET NOCOUNT ON;
SELECT
TOP 1
	@outReservation_ID = Reservation_ID
FROM Reservation
WHERE Restaurant_ID = @intRestaurant_ID
AND Member_ID = @intMember_ID
ORDER BY Reservation_Datetime DESC

END