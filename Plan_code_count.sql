USE [CDS]
GO

SELECT COUNT(policy.[Plan_Code_ID]) AS Counts,
[Plan_Code],
lookupdeets.LookupDetailID
  FROM [Policy].[Policy] AS policy

  JOIN( SELECT Plan_code.[Plan_Code],
  Plan_Code.Plan_Code_ID
  FROM Product.Plan_code
	 WHERE plan_code.[Plan_Code] LIKE '%EIUL3%' 
		OR plan_code.[Plan_Code] LIKE '%LBIUL%'
		OR plan_code.[Plan_Code] LIKE '%MEIUL3%')
	AS plan_code
  ON Plan_Code.Plan_Code_ID = policy.Plan_Code_ID

  JOIN( SELECT lookupdeets.LookupDetailID
  FROM [Lookup].[LookupDetails] AS lookupdeets
	WHERE lookupdeets.LookupDetailID = '37'
		OR lookupdeets.LookupDetailID = '38'
		OR lookupdeets.LookupDetailID = '39'
		OR lookupdeets.LookupDetailID = '42')
	AS lookupdeets
  ON lookupdeets.LookupDetailID = policy.Admin_Status_ID


GROUP BY [Plan_Code], lookupdeets.LookupDetailID
GO
