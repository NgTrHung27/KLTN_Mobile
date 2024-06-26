// To parse this JSON data, do
//
//     final schools = schoolsFromJson(jsonString);

import 'dart:convert';

List<Schools> schoolsFromJson(String str) => List<Schools>.from(json.decode(str).map((x) => Schools.fromJson(x)));

String schoolsToJson(List<Schools> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Schools {
    String id;
    String logo;
    String background;
    String name;
    String? short;
    String? description;
    String? history;
    String color;
    bool isPublished;
    String country;
    DateTime createdAt;
    DateTime updatedAt;
    List<News> news;
    List<dynamic> galleries;
    List<Location> locations;
    List<Program> programs;
    List<Scholarship> scholarships;

    Schools({
        required this.id,
        required this.logo,
        required this.background,
        required this.name,
        required this.short,
        required this.description,
        required this.history,
        required this.color,
        required this.isPublished,
        required this.country,
        required this.createdAt,
        required this.updatedAt,
        required this.news,
        required this.galleries,
        required this.locations,
        required this.programs,
        required this.scholarships,
    });

    Schools copyWith({
        String? id,
        String? logo,
        String? background,
        String? name,
        String? short,
        String? description,
        String? history,
        String? color,
        bool? isPublished,
        String? country,
        DateTime? createdAt,
        DateTime? updatedAt,
        List<News>? news,
        List<dynamic>? galleries,
        List<Location>? locations,
        List<Program>? programs,
        List<Scholarship>? scholarships,
    }) => 
        Schools(
            id: id ?? this.id,
            logo: logo ?? this.logo,
            background: background ?? this.background,
            name: name ?? this.name,
            short: short ?? this.short,
            description: description ?? this.description,
            history: history ?? this.history,
            color: color ?? this.color,
            isPublished: isPublished ?? this.isPublished,
            country: country ?? this.country,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            news: news ?? this.news,
            galleries: galleries ?? this.galleries,
            locations: locations ?? this.locations,
            programs: programs ?? this.programs,
            scholarships: scholarships ?? this.scholarships,
        );

    factory Schools.fromJson(Map<String, dynamic> json) => Schools(
        id: json["id"],
        logo: json["logo"],
        background: json["background"],
        name: json["name"],
        short: json["short"],
        description: json["description"],
        history: json["history"],
        color: json["color"],
        isPublished: json["isPublished"],
        country: json["country"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        news: List<News>.from(json["news"].map((x) => News.fromJson(x))),
        galleries: List<dynamic>.from(json["galleries"].map((x) => x)),
        locations: List<Location>.from(json["locations"].map((x) => Location.fromJson(x))),
        programs: List<Program>.from(json["programs"].map((x) => Program.fromJson(x))),
        scholarships: List<Scholarship>.from(json["scholarships"].map((x) => Scholarship.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "logo": logo,
        "background": background,
        "name": name,
        "short": short,
        "description": description,
        "history": history,
        "color": color,
        "isPublished": isPublished,
        "country": country,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "news": List<dynamic>.from(news.map((x) => x.toJson())),
        "galleries": List<dynamic>.from(galleries.map((x) => x)),
        "locations": List<dynamic>.from(locations.map((x) => x.toJson())),
        "programs": List<dynamic>.from(programs.map((x) => x.toJson())),
        "scholarships": List<dynamic>.from(scholarships.map((x) => x.toJson())),
    };
}

class Location {
    String id;
    String cover;
    String name;
    String address;
    bool isMain;
    String schoolId;
    DateTime createdAt;
    DateTime updatedAt;
    List<dynamic> contacts;
    List<dynamic> images;

    Location({
        required this.id,
        required this.cover,
        required this.name,
        required this.address,
        required this.isMain,
        required this.schoolId,
        required this.createdAt,
        required this.updatedAt,
        required this.contacts,
        required this.images,
    });

    Location copyWith({
        String? id,
        String? cover,
        String? name,
        String? address,
        bool? isMain,
        String? schoolId,
        DateTime? createdAt,
        DateTime? updatedAt,
        List<dynamic>? contacts,
        List<dynamic>? images,
    }) => 
        Location(
            id: id ?? this.id,
            cover: cover ?? this.cover,
            name: name ?? this.name,
            address: address ?? this.address,
            isMain: isMain ?? this.isMain,
            schoolId: schoolId ?? this.schoolId,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            contacts: contacts ?? this.contacts,
            images: images ?? this.images,
        );

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        cover: json["cover"],
        name: json["name"],
        address: json["address"],
        isMain: json["isMain"],
        schoolId: json["schoolId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        contacts: List<dynamic>.from(json["contacts"].map((x) => x)),
        images: List<dynamic>.from(json["images"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "cover": cover,
        "name": name,
        "address": address,
        "isMain": isMain,
        "schoolId": schoolId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "contacts": List<dynamic>.from(contacts.map((x) => x)),
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}

class News {
    String id;
    String title;
    String content;
    String type;
    String cover;
    bool isPublished;
    String schoolId;
    DateTime createdAt;
    DateTime updatedAt;

    News({
        required this.id,
        required this.title,
        required this.content,
        required this.type,
        required this.cover,
        required this.isPublished,
        required this.schoolId,
        required this.createdAt,
        required this.updatedAt,
    });

    News copyWith({
        String? id,
        String? title,
        String? content,
        String? type,
        String? cover,
        bool? isPublished,
        String? schoolId,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        News(
            id: id ?? this.id,
            title: title ?? this.title,
            content: content ?? this.content,
            type: type ?? this.type,
            cover: cover ?? this.cover,
            isPublished: isPublished ?? this.isPublished,
            schoolId: schoolId ?? this.schoolId,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory News.fromJson(Map<String, dynamic> json) => News(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        type: json["type"],
        cover: json["cover"],
        isPublished: json["isPublished"],
        schoolId: json["schoolId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "type": type,
        "cover": cover,
        "isPublished": isPublished,
        "schoolId": schoolId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

class Program {
    String id;
    String name;
    String description;
    String cover;
    bool isPublished;
    String schoolId;
    DateTime createdAt;
    DateTime updatedAt;
    List<StudentProgram> studentPrograms;

    Program({
        required this.id,
        required this.name,
        required this.description,
        required this.cover,
        required this.isPublished,
        required this.schoolId,
        required this.createdAt,
        required this.updatedAt,
        required this.studentPrograms,
    });

    Program copyWith({
        String? id,
        String? name,
        String? description,
        String? cover,
        bool? isPublished,
        String? schoolId,
        DateTime? createdAt,
        DateTime? updatedAt,
        List<StudentProgram>? studentPrograms,
    }) => 
        Program(
            id: id ?? this.id,
            name: name ?? this.name,
            description: description ?? this.description,
            cover: cover ?? this.cover,
            isPublished: isPublished ?? this.isPublished,
            schoolId: schoolId ?? this.schoolId,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            studentPrograms: studentPrograms ?? this.studentPrograms,
        );

    factory Program.fromJson(Map<String, dynamic> json) => Program(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        cover: json["cover"],
        isPublished: json["isPublished"],
        schoolId: json["schoolId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        studentPrograms: List<StudentProgram>.from(json["studentPrograms"].map((x) => StudentProgram.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "cover": cover,
        "isPublished": isPublished,
        "schoolId": schoolId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "studentPrograms": List<dynamic>.from(studentPrograms.map((x) => x.toJson())),
    };
}

class StudentProgram {
    StudentProgramStudent student;

    StudentProgram({
        required this.student,
    });

    StudentProgram copyWith({
        StudentProgramStudent? student,
    }) => 
        StudentProgram(
            student: student ?? this.student,
        );

    factory StudentProgram.fromJson(Map<String, dynamic> json) => StudentProgram(
        student: StudentProgramStudent.fromJson(json["student"]),
    );

    Map<String, dynamic> toJson() => {
        "student": student.toJson(),
    };
}

class StudentProgramStudent {
    String id;
    String? studentCode;
    Account account;
    String? cover;
    String degreeType;
    String certificateType;
    String gradeType;
    double gradeScore;
    String status;

    StudentProgramStudent({
        required this.id,
        required this.studentCode,
        required this.account,
        required this.cover,
        required this.degreeType,
        required this.certificateType,
        required this.gradeType,
        required this.gradeScore,
        required this.status,
    });

    StudentProgramStudent copyWith({
        String? id,
        String? studentCode,
        Account? account,
        String? cover,
        String? degreeType,
        String? certificateType,
        String? gradeType,
        double? gradeScore,
        String? status,
    }) => 
        StudentProgramStudent(
            id: id ?? this.id,
            studentCode: studentCode ?? this.studentCode,
            account: account ?? this.account,
            cover: cover ?? this.cover,
            degreeType: degreeType ?? this.degreeType,
            certificateType: certificateType ?? this.certificateType,
            gradeType: gradeType ?? this.gradeType,
            gradeScore: gradeScore ?? this.gradeScore,
            status: status ?? this.status,
        );

    factory StudentProgramStudent.fromJson(Map<String, dynamic> json) => StudentProgramStudent(
        id: json["id"],
        studentCode: json["studentCode"],
        account: Account.fromJson(json["account"]),
        cover: json["cover"],
        degreeType: json["degreeType"],
        certificateType: json["certificateType"],
        gradeType: json["gradeType"],
        gradeScore: json["gradeScore"]?.toDouble(),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "studentCode": studentCode,
        "account": account.toJson(),
        "cover": cover,
        "degreeType": degreeType,
        "certificateType": certificateType,
        "gradeType": gradeType,
        "gradeScore": gradeScore,
        "status": status,
    };
}

class Account {
    String name;

    Account({
        required this.name,
    });

    Account copyWith({
        String? name,
    }) => 
        Account(
            name: name ?? this.name,
        );

    factory Account.fromJson(Map<String, dynamic> json) => Account(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}

class Scholarship {
    String id;
    String name;
    String description;
    String cover;
    bool isPublished;
    String schoolId;
    DateTime createdAt;
    DateTime updatedAt;
    List<ScholarshipImage> images;
    List<Owner> owners;
    School school;

    Scholarship({
        required this.id,
        required this.name,
        required this.description,
        required this.cover,
        required this.isPublished,
        required this.schoolId,
        required this.createdAt,
        required this.updatedAt,
        required this.images,
        required this.owners,
        required this.school,
    });

    Scholarship copyWith({
        String? id,
        String? name,
        String? description,
        String? cover,
        bool? isPublished,
        String? schoolId,
        DateTime? createdAt,
        DateTime? updatedAt,
        List<ScholarshipImage>? images,
        List<Owner>? owners,
        School? school,
    }) => 
        Scholarship(
            id: id ?? this.id,
            name: name ?? this.name,
            description: description ?? this.description,
            cover: cover ?? this.cover,
            isPublished: isPublished ?? this.isPublished,
            schoolId: schoolId ?? this.schoolId,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            images: images ?? this.images,
            owners: owners ?? this.owners,
            school: school ?? this.school,
        );

    factory Scholarship.fromJson(Map<String, dynamic> json) => Scholarship(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        cover: json["cover"],
        isPublished: json["isPublished"],
        schoolId: json["schoolId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        images: List<ScholarshipImage>.from(json["images"].map((x) => ScholarshipImage.fromJson(x))),
        owners: List<Owner>.from(json["owners"].map((x) => Owner.fromJson(x))),
        school: School.fromJson(json["school"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "cover": cover,
        "isPublished": isPublished,
        "schoolId": schoolId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "owners": List<dynamic>.from(owners.map((x) => x.toJson())),
        "school": school.toJson(),
    };
}

class ScholarshipImage {
    String id;
    String url;
    String scholarshipId;

    ScholarshipImage({
        required this.id,
        required this.url,
        required this.scholarshipId,
    });

    ScholarshipImage copyWith({
        String? id,
        String? url,
        String? scholarshipId,
    }) => 
        ScholarshipImage(
            id: id ?? this.id,
            url: url ?? this.url,
            scholarshipId: scholarshipId ?? this.scholarshipId,
        );

    factory ScholarshipImage.fromJson(Map<String, dynamic> json) => ScholarshipImage(
        id: json["id"],
        url: json["url"],
        scholarshipId: json["scholarshipId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "scholarshipId": scholarshipId,
    };
}

class Owner {
    String id;
    String studentId;
    String scholarshipId;
    DateTime createdAt;
    DateTime updatedAt;
    OwnerStudent student;

    Owner({
        required this.id,
        required this.studentId,
        required this.scholarshipId,
        required this.createdAt,
        required this.updatedAt,
        required this.student,
    });

    Owner copyWith({
        String? id,
        String? studentId,
        String? scholarshipId,
        DateTime? createdAt,
        DateTime? updatedAt,
        OwnerStudent? student,
    }) => 
        Owner(
            id: id ?? this.id,
            studentId: studentId ?? this.studentId,
            scholarshipId: scholarshipId ?? this.scholarshipId,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            student: student ?? this.student,
        );

    factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["id"],
        studentId: json["studentId"],
        scholarshipId: json["scholarshipId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        student: OwnerStudent.fromJson(json["student"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "studentId": studentId,
        "scholarshipId": scholarshipId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "student": student.toJson(),
    };
}

class OwnerStudent {
    String id;
    String? studentCode;
    String degreeType;
    String certificateType;
    String certificateImg;
    String gradeType;
    double gradeScore;
    String? cover;
    dynamic additional;
    String status;
    String accountId;
    String schoolId;
    DateTime createdAt;
    DateTime updatedAt;

    OwnerStudent({
        required this.id,
        required this.studentCode,
        required this.degreeType,
        required this.certificateType,
        required this.certificateImg,
        required this.gradeType,
        required this.gradeScore,
        required this.cover,
        required this.additional,
        required this.status,
        required this.accountId,
        required this.schoolId,
        required this.createdAt,
        required this.updatedAt,
    });

    OwnerStudent copyWith({
        String? id,
        String? studentCode,
        String? degreeType,
        String? certificateType,
        String? certificateImg,
        String? gradeType,
        double? gradeScore,
        String? cover,
        dynamic additional,
        String? status,
        String? accountId,
        String? schoolId,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        OwnerStudent(
            id: id ?? this.id,
            studentCode: studentCode ?? this.studentCode,
            degreeType: degreeType ?? this.degreeType,
            certificateType: certificateType ?? this.certificateType,
            certificateImg: certificateImg ?? this.certificateImg,
            gradeType: gradeType ?? this.gradeType,
            gradeScore: gradeScore ?? this.gradeScore,
            cover: cover ?? this.cover,
            additional: additional ?? this.additional,
            status: status ?? this.status,
            accountId: accountId ?? this.accountId,
            schoolId: schoolId ?? this.schoolId,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory OwnerStudent.fromJson(Map<String, dynamic> json) => OwnerStudent(
        id: json["id"],
        studentCode: json["studentCode"],
        degreeType: json["degreeType"],
        certificateType: json["certificateType"],
        certificateImg: json["certificateImg"],
        gradeType: json["gradeType"],
        gradeScore: json["gradeScore"]?.toDouble(),
        cover: json["cover"],
        additional: json["additional"],
        status: json["status"],
        accountId: json["accountId"],
        schoolId: json["schoolId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "studentCode": studentCode,
        "degreeType": degreeType,
        "certificateType": certificateType,
        "certificateImg": certificateImg,
        "gradeType": gradeType,
        "gradeScore": gradeScore,
        "cover": cover,
        "additional": additional,
        "status": status,
        "accountId": accountId,
        "schoolId": schoolId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

class School {
    String id;
    String logo;
    String background;
    String name;
    dynamic short;
    dynamic description;
    dynamic history;
    String color;
    bool isPublished;
    String country;
    DateTime createdAt;
    DateTime updatedAt;

    School({
        required this.id,
        required this.logo,
        required this.background,
        required this.name,
        required this.short,
        required this.description,
        required this.history,
        required this.color,
        required this.isPublished,
        required this.country,
        required this.createdAt,
        required this.updatedAt,
    });

    School copyWith({
        String? id,
        String? logo,
        String? background,
        String? name,
        dynamic short,
        dynamic description,
        dynamic history,
        String? color,
        bool? isPublished,
        String? country,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        School(
            id: id ?? this.id,
            logo: logo ?? this.logo,
            background: background ?? this.background,
            name: name ?? this.name,
            short: short ?? this.short,
            description: description ?? this.description,
            history: history ?? this.history,
            color: color ?? this.color,
            isPublished: isPublished ?? this.isPublished,
            country: country ?? this.country,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory School.fromJson(Map<String, dynamic> json) => School(
        id: json["id"],
        logo: json["logo"],
        background: json["background"],
        name: json["name"],
        short: json["short"],
        description: json["description"],
        history: json["history"],
        color: json["color"],
        isPublished: json["isPublished"],
        country: json["country"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "logo": logo,
        "background": background,
        "name": name,
        "short": short,
        "description": description,
        "history": history,
        "color": color,
        "isPublished": isPublished,
        "country": country,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
