/*
	Simulate the functions lag() and lead() using outer apply

*/

SELECT TOP 10 TPREV.N AS PREV, T.N AS CUR, TNEXT.N AS NEXT
  FROM dbo.tbl_numbers T
 OUTER APPLY
  (
	SELECT TOP 1 iT.N
	  FROM dbo.tbl_numbers iT
	 WHERE iT.N < T.N
	ORDER BY iT.N DESC
  ) TPREV
 OUTER APPLY
  (
	SELECT TOP 1 iT.N
	  FROM dbo.tbl_numbers iT
	 WHERE iT.N > T.N
	ORDER BY iT.N ASC
  ) TNEXT