USE SEDC_ACADEMY_HOMEWORK
GO

SET IDENTITY_INSERT [dbo].[AchievementType] ON 
GO
INSERT [dbo].[AchievementType] ([ID], [Name], [Description], [ParticipationRate]) VALUES (0, N'Domasni', NULL, 7)
GO
INSERT [dbo].[AchievementType] ([ID], [Name], [Description], [ParticipationRate]) VALUES (1, N'Seminarska', NULL, 8)
GO
INSERT [dbo].[AchievementType] ([ID], [Name], [Description], [ParticipationRate]) VALUES (2, N'Redovnost', NULL, 5)
GO
INSERT [dbo].[AchievementType] ([ID], [Name], [Description], [ParticipationRate]) VALUES (3, N'Kolokvium1', NULL, 40)
GO
INSERT [dbo].[AchievementType] ([ID], [Name], [Description], [ParticipationRate]) VALUES (4, N'Kolokvium2', NULL, 40)
GO
INSERT [dbo].[AchievementType] ([ID], [Name], [Description], [ParticipationRate]) VALUES (5, N'Ispit', NULL, 80)
GO
SET IDENTITY_INSERT [dbo].[AchievementType] OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (0, N'Бизнис и менаџмент', 6, 1, 1)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (1, N'Вовед во компјутерските науки', 6, 1, 1)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (2, N'Калкулус', 6, 1, 1)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (3, N'Професионални вештини', 6, 1, 1)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (4, N'Структурно програмирање', 6, 1, 1)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (5, N'Основи на веб дизајн', 6, 1, 2)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (6, N'Архитектура и организација на компјутери', 6, 1, 2)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (7, N'Дискретна математика', 6, 1, 2)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (8, N'Објектно ориентирана анализа и дизајн', 6, 1, 2)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (9, N'Објектно-ориентирано програмирање', 6, 1, 2)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (10, N'Спорт и здравје', 6, 1, 2)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (11, N'Инженерска математика', 6, 2, 3)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (12, N'Интернет програмирање на клиентска страна', 6, 2, 3)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (13, N'Алгоритми и податочни структури', 6, 2, 3)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (14, N'Веројатност и статистика', 6, 2, 3)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (15, N'Компјутерски мрежи и безбедност', 6, 2, 3)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (16, N'Вештачка интелигенција', 6, 2, 4)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (17, N'Дигитално процесирање на слика', 6, 2, 4)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (18, N'Дизајн на алгоритми', 6, 2, 4)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (19, N'Анализа на софтверските барања', 6, 2, 4)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (20, N'Оперативни системи', 6, 2, 4)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (21, N'Информациска безбедност', 6, 3, 5)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (22, N'Напреден веб дизајн', 6, 3, 5)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (23, N'Бази на податоци', 6, 3, 5)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (24, N'Вовед во науката за податоци', 6, 3, 5)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (25, N'Дизајн и архитектура на софтвер', 6, 3, 5)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (26, N'Машинско учење', 6, 3, 6)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (27, N'Податочно рударство', 6, 3, 6)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (28, N'Дизајн на интеракцијата човек-компјутер', 6, 3, 6)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (29, N'Интегрирани системи', 6, 3, 6)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (30, N'Софтверски квалитет и тестирање', 6, 3, 6)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (31, N'Администрација на бази на податоци', 6, 4, 7)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (32, N'Операциони истражувања', 6, 4, 7)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (33, N'Рударење на масивни податоци', 6, 4, 7)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (34, N'Програмирање на видео игри', 6, 4, 7)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (35, N'Тимски проект', 6, 4, 7)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (36, N'Дипломска работа', 6, 4, 8)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (37, N'Напредни бази на податоци', 6, 4, 8)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (38, N'Интелигентни информациски системи', 6, 4, 8)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (39, N'Складови на податоци и аналитичка обработка', 6, 4, 8)
GO
INSERT [dbo].[Course] ([ID], [Name], [Credit], [AcademicYear], [Semester]) VALUES (40, N'Управување со ИКТ проекти', 6, 4, 8)
GO
SET IDENTITY_INSERT [dbo].[Course] OFF
GO

