func checkUserStatus(users: [User], userId: Int) -> UserStatus {
    let foundUser = users.first{user in
        user.id == userId
    }
    if foundUser == nil {
        return .userNotFound
    }
    let user = foundUser!
    if user.isActive == false {
        return .userInactive
    }
    return .userActive
}
