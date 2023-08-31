import Foundation

func createEmojis(theme: String) -> [String] {
    switch  theme {
    case "cars":
        return ["🚕", "🚜", "🏎️", "🚑", "🚓", "🚒", "🛻", "🚗"].shuffled()
    case "planes":
        return ["🚁", "✈️", "🚀", "🛸", "🚠", "🚟", "🛩️", "🛰️"].shuffled()
    case "ships":
        return ["🛶", "⛵️", "🛟", "🚤", "🛥️", "🛳️", "⛴️", "⚓️"].shuffled()
    case "animals":
        return ["🐗", "🦒", "🐽", "🐎", "🙈", "🐮", "🐶", "🦘"].shuffled()
    case "reptiles":
        return ["🦎", "🐢", "🐍", "🐊", "🐸", "🐉", "🦕", "🦖"].shuffled()
    case "fishes":
        return ["🐳", "🐋", "🦈", "🐠", "🐡", "🦑", "🐬", "🦞"].shuffled()
    case "moon":
        return ["🌕", "🌖", "🌗", "🌘", "🌑", "🌒", "🌓", "🌔"].shuffled()
    default:
        return []
    }
}

