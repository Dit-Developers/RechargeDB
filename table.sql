-- User Table
CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(100) NOT NULL,
    Role VARCHAR(20) CHECK (Role IN ('Admin', 'User')) NOT NULL,
    Status VARCHAR(10) CHECK (Status IN ('Active', 'Inactive')) NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);

-- Wallet Table
CREATE TABLE Wallet (
    WalletID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    Balance DECIMAL(10,2) DEFAULT 0 NOT NULL,
    LastUpdated DATETIME DEFAULT GETDATE()
);

-- Recharge Plans
CREATE TABLE RechargePlans (
    PlanID INT IDENTITY(1,1) PRIMARY KEY,
    PlanType VARCHAR(20) CHECK (PlanType IN ('TopUp', 'Special')),
    Amount DECIMAL(10,2) NOT NULL,
    TalkTime DECIMAL(10,2),
    Validity INT CHECK (Validity > 0) NOT NULL,
    Description VARCHAR(255)
);

-- Transactions
CREATE TABLE Transactions (
    TransactionID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    MobileNumber VARCHAR(10) NOT NULL CHECK (MobileNumber LIKE '[0-9]{10}'),
    PlanID INT FOREIGN KEY REFERENCES RechargePlans(PlanID),
    PaymentStatus VARCHAR(20) CHECK (PaymentStatus IN ('Pending', 'Completed', 'Failed')),
    TransactionDate DATETIME DEFAULT GETDATE()
);

-- Refunds Table
CREATE TABLE Refunds (
    RefundID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    TransactionID INT FOREIGN KEY REFERENCES Transactions(TransactionID),
    RefundAmount DECIMAL(10,2) NOT NULL,
    RefundStatus VARCHAR(20) CHECK (RefundStatus IN ('Initiated', 'Completed', 'Rejected')),
    RequestDate DATETIME DEFAULT GETDATE()
);

-- Notifications Table
CREATE TABLE Notifications (
    NotificationID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    Message TEXT NOT NULL,
    Status VARCHAR(20) CHECK (Status IN ('Unread', 'Read')) DEFAULT 'Unread',
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- Admin Logs
CREATE TABLE AdminLogs (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    AdminID INT FOREIGN KEY REFERENCES Users(UserID),
    Action TEXT NOT NULL,
    Timestamp DATETIME DEFAULT GETDATE()
);

-- API Keys Table
CREATE TABLE APIKeys (
    APIKeyID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    APIKey VARCHAR(255) UNIQUE NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- Customer Support Tickets
CREATE TABLE SupportTickets (
    TicketID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    Subject VARCHAR(255) NOT NULL,
    Message TEXT NOT NULL,
    Status VARCHAR(20) CHECK (Status IN ('Open', 'Closed', 'Pending')) DEFAULT 'Open',
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- Subscription Plans
CREATE TABLE SubscriptionPlans (
    SubscriptionID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    PlanName VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Duration INT CHECK (Duration > 0) NOT NULL,
    StartDate DATETIME DEFAULT GETDATE(),
    EndDate DATETIME NOT NULL
);

-- Usage History
CREATE TABLE UsageHistory (
    UsageID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    ActivityType VARCHAR(50) NOT NULL,
    Details TEXT NOT NULL,
    Timestamp DATETIME DEFAULT GETDATE()
);

-- Payment Methods
CREATE TABLE PaymentMethods (
    PaymentMethodID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    CardNumber VARCHAR(16) NOT NULL,
    ExpiryDate DATE NOT NULL,
    CardType VARCHAR(20) CHECK (CardType IN ('Visa', 'MasterCard', 'Amex')) NOT NULL
);

-- Discount Coupons
CREATE TABLE DiscountCoupons (
    CouponID INT IDENTITY(1,1) PRIMARY KEY,
    Code VARCHAR(50) UNIQUE NOT NULL,
    DiscountPercentage DECIMAL(5,2) CHECK (DiscountPercentage > 0 AND DiscountPercentage <= 100) NOT NULL,
    ExpiryDate DATE NOT NULL
);

-- User Coupons
CREATE TABLE UserCoupons (
    UserCouponID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    CouponID INT FOREIGN KEY REFERENCES DiscountCoupons(CouponID),
    RedeemedAt DATETIME DEFAULT GETDATE()
);

