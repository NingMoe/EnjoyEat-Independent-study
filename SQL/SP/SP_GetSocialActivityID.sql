SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		George Liu
-- Create date: 2015/11/28
-- Description:	取得社群活動編號
-- Parameter:
--			@intMember_ID 會員編號
-- OutPut:
--			@outSocialActivity_ID 社群活動編號
-- =============================================
IF OBJECT_ID(N'dbo.SP_GetSocialActivityID', 'p') IS NOT NULL
DROP PROCEDURE dbo.SP_GetSocialActivityID
GO
CREATE PROCEDURE [dbo].[SP_GetSocialActivityID]
	@intMember_ID AS int,
	@outSocialActivity_ID AS int OUTPUT
AS
BEGIN

SET NOCOUNT ON;
SELECT
TOP 1
	@outSocialActivity_ID = SocialActivity_ID
FROM SocialActivity
WHERE Member_ID = @intMember_ID
ORDER BY SocialActivity_Datetime DESC

END