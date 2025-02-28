-- Insert Data for SubscriptionPlans Table
INSERT INTO SubscriptionPlans (UserID, PlanName, Price, Duration, StartDate, EndDate) VALUES
(1, 'Basic Plan', 9.99, 30, GETDATE(), DATEADD(DAY, 30, GETDATE())),
(2, 'Standard Plan', 19.99, 30, GETDATE(), DATEADD(DAY, 30, GETDATE())),
(3, 'Premium Plan', 29.99, 30, GETDATE(), DATEADD(DAY, 30, GETDATE())),
(4, 'Basic Plan', 9.99, 30, GETDATE(), DATEADD(DAY, 30, GETDATE())),
(5, 'Enterprise Plan', 49.99, 90, GETDATE(), DATEADD(DAY, 90, GETDATE())),
(6, 'Standard Plan', 19.99, 30, GETDATE(), DATEADD(DAY, 30, GETDATE())),
(7, 'Premium Plan', 29.99, 30, GETDATE(), DATEADD(DAY, 30, GETDATE())),
(8, 'Basic Plan', 9.99, 30, GETDATE(), DATEADD(DAY, 30, GETDATE())),
(9, 'Enterprise Plan', 49.99, 90, GETDATE(), DATEADD(DAY, 90, GETDATE())),
(10, 'Standard Plan', 19.99, 30, GETDATE(), DATEADD(DAY, 30, GETDATE())),
(11, 'Basic Plan', 9.99, 30, GETDATE(), DATEADD(DAY, 30, GETDATE())),
(12, 'Premium Plan', 29.99, 30, GETDATE(), DATEADD(DAY, 30, GETDATE())),
(13, 'Enterprise Plan', 49.99, 90, GETDATE(), DATEADD(DAY, 90, GETDATE())),
(14, 'Standard Plan', 19.99, 30, GETDATE(), DATEADD(DAY, 30, GETDATE())),
(15, 'Basic Plan', 9.99, 30, GETDATE(), DATEADD(DAY, 30, GETDATE())),
(16, 'Premium Plan', 29.99, 30, GETDATE(), DATEADD(DAY, 30, GETDATE())),
(17, 'Enterprise Plan', 49.99, 90, GETDATE(), DATEADD(DAY, 90, GETDATE())),
(18, 'Standard Plan', 19.99, 30, GETDATE(), DATEADD(DAY, 30, GETDATE())),
(19, 'Basic Plan', 9.99, 30, GETDATE(), DATEADD(DAY, 30, GETDATE())),
(20, 'Premium Plan', 29.99, 30, GETDATE(), DATEADD(DAY, 30, GETDATE()));
