USE [KKAP_GFT]
GO

/****** Object:  View [dbo].[V_ZYS_BOU]    Script Date: 2016/12/14 18:40:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[V_ZYS_BOU]
AS
SELECT                      dbo.XD_ZYS.ZYS_BouekiNo AS BouekiNo, dbo.D_SJD.SJD_Keiyaku AS KeiyakuNo, 
                                      dbo.XD_ZYS.ZYS_SeihinCode AS SeihinCode, dbo.XD_ZYS.ZYS_ZaiKubun AS ZaiKubun, dbo.V_MST_BOU.Siire, 
                                      dbo.V_MST_BOU.SiireName, dbo.V_MST_BOU.Country, dbo.V_MST_BOU.CountryName1, 
                                      dbo.V_MST_BOU.CountryName2, dbo.XD_ZYS.ZYS_ZaiCode AS ZaiCode, dbo.V_MST_BOU.Kubun, 
                                      dbo.V_MST_BOU.Kubun_Name1 AS KubunName1, dbo.V_MST_BOU.Kubun_Name2 AS KubunName2, 
                                      dbo.V_MST_BOU.Hinban, dbo.XD_ZYS.ZYS_Kikaku AS Kikaku, dbo.XD_ZYS.ZYS_ColNo AS ColNo, 
                                      dbo.XD_ZYS.ZYS_Inner AS [Inner], dbo.XD_ZYS.ZYS_Suryo AS HitsuyoYojaku, dbo.XD_ZYS.ZYS_Loss AS Loss, 
                                      CEILING(dbo.XD_ZYS.ZYS_Suryo * (1 + dbo.XD_ZYS.ZYS_Loss / 100) * 100) / 100 AS LossInHitsuyoYojaku, 
                                      dbo.V_MST_BOU.ROLL, CEILING(CEILING(dbo.XD_ZYS.ZYS_Suryo * (1 + dbo.XD_ZYS.ZYS_Loss / 100) * 100) 
                                      / 100 / dbo.V_MST_BOU.ROLL) AS HitsuyoSu, ISNULL(dbo.V_SKSM_BOU.ShijiSu, 0) AS ShijiZumiSu, 
                                      CEILING(CEILING(dbo.XD_ZYS.ZYS_Suryo * (1 + dbo.XD_ZYS.ZYS_Loss / 100) * 100) / 100 / dbo.V_MST_BOU.ROLL) 
                                      - ISNULL(dbo.V_SKSM_BOU.ShijiSu, 0) AS ShijiZanSu, dbo.XD_ZYS.ZYS_Offer AS Offer, dbo.V_INVM_BOU.YushoSuryo, 
                                      dbo.V_INVM_BOU.MushoSuryo, dbo.V_INVM_BOU.YushoSuryo + dbo.V_INVM_BOU.MushoSuryo AS ShukkaZumiSu, 
                                      CEILING(CEILING(dbo.XD_ZYS.ZYS_Suryo * (1 + dbo.XD_ZYS.ZYS_Loss / 100) * 100) / 100 / dbo.V_MST_BOU.ROLL) 
                                      - (dbo.V_INVM_BOU.YushoSuryo + dbo.V_INVM_BOU.MushoSuryo) AS ShukkaZanSu, 
                                      dbo.XD_ZYS.ZYS_KannouKubun AS KannouKubun, dbo.XD_ZYS.ZYS_Biko AS Biko, 
                                      dbo.XD_ZYS.ZYS_ShukkaYoteiMethod AS ShukkaYoteiMethod
FROM                         dbo.XD_ZYS LEFT OUTER JOIN
                                      dbo.V_INVM_BOU ON dbo.XD_ZYS.ZYS_BouekiNo = dbo.V_INVM_BOU.INVM_BouekiNo AND 
                                      dbo.XD_ZYS.ZYS_SeihinCode = dbo.V_INVM_BOU.INVM_SeihinCode AND 
                                      dbo.XD_ZYS.ZYS_ZaiKubun = dbo.V_INVM_BOU.INVM_ZaiKubun AND 
                                      dbo.XD_ZYS.ZYS_ZaiCode = dbo.V_INVM_BOU.INVM_ZaiCode AND 
                                      dbo.XD_ZYS.ZYS_ColNo = dbo.V_INVM_BOU.INVM_ColNo AND 
                                      dbo.XD_ZYS.ZYS_Inner = dbo.V_INVM_BOU.INVM_Inner LEFT OUTER JOIN
                                      dbo.V_SKSM_BOU ON dbo.XD_ZYS.ZYS_ColNo = dbo.V_SKSM_BOU.SKSM_ColNo AND 
                                      dbo.XD_ZYS.ZYS_ZaiCode = dbo.V_SKSM_BOU.SKSM_ZaiCode AND 
                                      dbo.XD_ZYS.ZYS_ZaiKubun = dbo.V_SKSM_BOU.SKSM_ZaiKubun AND 
                                      dbo.XD_ZYS.ZYS_SeihinCode = dbo.V_SKSM_BOU.SKSM_SeihinCode AND 
                                      dbo.XD_ZYS.ZYS_BouekiNo = dbo.V_SKSM_BOU.SKSM_BouekiNo LEFT OUTER JOIN
                                      dbo.V_MST_BOU ON dbo.XD_ZYS.ZYS_ZaiKubun = dbo.V_MST_BOU.kbn AND 
                                      dbo.XD_ZYS.ZYS_ZaiCode = dbo.V_MST_BOU.Code LEFT OUTER JOIN
                                      dbo.D_SJD ON dbo.XD_ZYS.ZYS_SeihinCode = dbo.D_SJD.SJD_Code

GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[19] 4[42] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4[30] 2[40] 3) )"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[69] 3) )"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4[50] 3) )"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3) )"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 1
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "XD_ZYS"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 367
               Right = 259
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "V_INVM_BOU"
            Begin Extent = 
               Top = 294
               Left = 297
               Bottom = 424
               Right = 480
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V_SKSM_BOU"
            Begin Extent = 
               Top = 309
               Left = 670
               Bottom = 486
               Right = 853
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V_MST_BOU"
            Begin Extent = 
               Top = 156
               Left = 671
               Bottom = 286
               Right = 866
            End
            DisplayFlags = 280
            TopColumn = 21
         End
         Begin Table = "D_SJD"
            Begin Extent = 
               Top = 0
               Left = 651
               Bottom = 130
               Right = 855
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 32
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ZYS_BOU'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 12030
         Alias = 2220
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ZYS_BOU'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ZYS_BOU'
GO

