import Foundation

// MARK: - ImagesEntity
struct ImagesEntity: Codable {
    let total, total_pages: Int?
    let results: [Result]?
}

// MARK: - Result
struct Result: Codable {
    let alt_description: String?
    let urls: Urls?
    let likes: Int?
    let user: User?
}


// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String?
    let thumb, small_s3: String?
}

// MARK: - User
struct User: Codable {
    let username: String?
    let profile_image: ProfileImage?
}

// MARK: - ProfileImage
struct ProfileImage: Codable {
    let small, medium, large: String?
}
