-- =============================================
-- Author:		George Liu
-- Create date: 2015/10/25
-- Description:	格式化電話
-- Parameter:
--			@strArea 區碼
--			@strPhone 電話號碼
--			@strExt 分機號碼
-- =============================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID(N'dbo.FN_Phone_Formate', N'FN') IS NOT NULL
DROP FUNCTION dbo.FN_Phone_Formate
GO
CREATE FUNCTION [dbo].[FN_Phone_Formate]
( @strArea AS char(5) ,
  @strPhone AS char(10) ,
  @strExt AS char(6) 
)
RETURNS varchar(35)
AS
BEGIN
  DECLARE @strResult varchar(35)
SET @strResult = ''
IF ISNULL(REPLACE(@strArea, ' ', ''), '') <> '' SET @strResult = '( ' + REPLACE(@strArea, ' ', '') + ' ) - '

IF ISNULL(REPLACE(@strPhone, ' ', ''), '') <> '' SET @strResult = @strResult + REPLACE(@strPhone, ' ', '')

IF ISNULL(REPLACE(@strExt, ' ', ''), '') <> '' SET @strResult = @strResult + ' # ' + REPLACE(@strExt, ' ', '')

RETURN @strResult
END