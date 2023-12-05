//
//  MockFactory.swift
//  MentalDiary
//
//  Created by Danylo Klymov on 05.12.2023.
//

import UIKit

struct MockFactory {
    static let topThreeServices = [
        RecommendedService(
            title: "Розкажи мені",
            image: Asset.tellme.image,
            link: "https://tellme.com.ua/"
        ),
        RecommendedService(
            title: "UA Mental Help",
            image: Asset.uamentalhelp.image,
            link: "https://uamentalhelp.org/"
        ),
        RecommendedService(
            title: "UA Mental Help",
            image: Asset.resiliencehub.image,
            link: "https://resiliencehub.com.ua/"
        ),
    ]
    
    static let services = [
        Service(
            title: "Психіатрична допомога українцям за кордоном: як її отримати",
            image: Asset.aboardhelp.image,
            link: "https://visitukraine.today/uk/blog/765/psixiatricna-dopomoga-ukraincyam-za-kordonom-yak-ii-otrimati"
        ),
        Service(
            title: "ПТСР - посттравматичний стресовий розлад",
            image: Asset.ptsr.image,
            link: "https://meclee.com/blog/obshchie/ptsr-posttravmatichniy-stresoviy-rozlad"
        ),
        Service(
            title: "Як налагодити стосунки у шлюбі",
            image: Asset.ptsr.image,
            link: "https://meclee.com/blog/obshchie/yak-nalagoditi-stosunki-u-shlyubi"
        ),
        Service(
            title: "Як зустріти своє кохання: шукаємо другу половинку",
            image: Asset.shlub.image,
            link: "https://meclee.com/blog/obshchie/yak-zustriti-svoye-kohannya-shukayemo-drugu-polovinku"
        ),
        Service(
            title: "Самотність: прийняти чи боротися?",
            image: Asset.samotnist.image,
            link: "https://meclee.com/blog/obshchie/samotnist-priynyati-chi-borotisya"
        ),
        Service(
            title: "Фобії та тривожні розлади",
            image: Asset.fobii.image,
            link: "https://meclee.com/blog/obshchie/fobiji-ta-trivozhni-rozladi"
        ),
        Service(
            title: "Порушення сну: види, причини та вирішення проблеми",
            image: Asset.sleep.image,
            link: "https://meclee.com/blog/obshchie/porushennya-snu-vidi-prichini-ta-virishennya-problemi"
        ),
        Service(
            title: "Біполярний розлад",
            image: Asset.sleep.image,
            link: "https://meclee.com/blog/obshchie/bipolyarniy-rozlad"
        )
    ]
    
    static let videos = [
        Video(
            title: "Депресія - найстрашніша хвороба людства - Роберт Сапольскі",
            description: "Професор Стенфордського університету Роберт Сапольскі стверджує, що депресія є найнебезпечнішою хворобою, з якою можна зіткнутися. Вона така ж реальна як цукровий діабет. Зараз це четверта причина інвалідності в США, і вона стає все більш поширеною.",
            image: Asset.video1.image,
            link: "https://www.youtube.com/watch?v=AXdspp-_uds"
        ),
        Video(
            title: "Психолог Марк Бартон. Как избежать кризиса в отношениях? О современных браках, детях и неуверенности",
            description: "Сегодня у меня в гостях известный российский Психолог, телеведущий, эксперт в отношениях, любящий муж и отец ... и просто невероятно харизматичный человек - Марк Бартон.",
            image: Asset.video2.image,
            link: "https://www.youtube.com/watch?v=qX3BS7elgAg"
        ),
        Video(
            title: "«Я Тебя Выбираю». Психолог Татьяна Мужицкая о глубоких отношениях на долгие годы, НЛП и браке",
            description: "В Интересный Подкаст пришла Татьяна Мужицкая! Татьяна — писательница и телеведущая, психолог, бизнес-тренер, международный сертифицированный тренер НЛП, и даже музыкант (!)",
            image: Asset.video3.image,
            link: "https://www.youtube.com/watch?v=M0f7xi1Gsuc"
        ),
        Video(
            title: "Как перестать себя накручивать? Врач-психиатр Михаил Тетюшкин о депрессии и постоянной тревожности",
            description: "Как выйти из депрессии? И как понять, что это больше, чем временная грусть?",
            image: Asset.video3.image,
            link: "https://www.youtube.com/watch?v=i-14HPJckgo"
        ),
    ]
}

struct RecommendedService {
    let title: String
    let image: UIImage
    let link: String
}

struct Service {
    let title: String
    let image: UIImage
    let link: String
}

struct Video {
    let title: String
    let description: String
    let image: UIImage
    let link: String
}
