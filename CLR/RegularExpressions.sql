/*
	
	- Enable CLR
	- Create assembly and function aliases

*/

EXEC sp_configure 'clr enabled', 1
RECONFIGURE WITH OVERRIDE

CREATE ASSEMBLY TextFunctions FROM 'D:\repos\sql-server\CLR\TextFunctions\bin\Debug\TextFunctions.dll'
GO

CREATE FUNCTION RegExMatch(@input NVARCHAR(MAX), @pattern NVARCHAR(512), @ignoreCase BIT = 1)
RETURNS BIT
AS EXTERNAL NAME TextFunctions.[TextFunctions.RegularExpressions].RegExMatch
GO

CREATE FUNCTION RegExReplace(@input NVARCHAR(MAX), @pattern NVARCHAR(512), @replacement NVARCHAR(MAX), @ignoreCase BIT = 1)
RETURNS NVARCHAR(MAX)
AS EXTERNAL NAME TextFunctions.[TextFunctions.RegularExpressions].RegExReplace
GO

--Test
--SELECT dbo.RegExMatch('132 asdas', '^\d+$', 1)
--SELECT dbo.RegExMatch('132', '^\d+$', 1)
--SELECT dbo.RegExReplace('ASDASD132 as1d111as', '\d', '', 1)