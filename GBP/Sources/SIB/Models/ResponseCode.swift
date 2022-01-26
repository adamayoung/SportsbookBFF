import Foundation

public enum ResponseCode: String, Equatable, Hashable, Codable {

    /// ImplyBets operation finished successfully.
    case success = "SUCCESS"
    /// Your account has been suspended. Please contact the Betfair helpdesk for more information.
    case accountSuspended = "ACCOUNT_SUSPENDED"
    /// Account is Pending Authorisation. Administrators have been informed.
    case accountPendingAuthorisation = "ACCOUNT_PENDING_AUTH"
    /// Your account has been suspended. Please contact the Betfair helpdesk for more information.
    case accountSuspendedKYC = "ACCOUNT_SUSPENDED_KYC"
    /// Your account has been suspended. Please contact the Betfair helpdesk for more information.
    case accountLocked = "ACCOUNT_LOCKED"
    /// The customer's registration is pending.
    case customerRegistrationPending = "CUST_REGISTRATION_PENDING"
    /// The account user is not allowed to perform this action since it is a master account.
    case accessDenied = "ACCESS_DENIED"

}
