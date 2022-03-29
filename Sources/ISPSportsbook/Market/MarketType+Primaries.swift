import Foundation
import Sportsbook

extension MarketType {

    static let boxingMatchBetting = Self("BOXING_MATCH_BETTING")
    static let davisToSantaRosa = Self("DAVIS_TO_SANTA_ROSA")
    static let extraTimeBetting = Self("EXTRA_TIME_BETTING")
    static let extraTimeResult = Self("EXTRA_TIME_RESULT")
    static let firstRoundLeader = Self("FIRST_ROUND_LEADER")
    static let foursomes = Self("FOURSOMES")
    static let fourballs = Self("FOURBALLS")
    static let genericMarket = Self("GENERIC_MARKET")
    static let handicapBetting = Self("HANDICAP_BETTING")
    static let headToHead = Self("HEAD_TO_HEAD")
    static let kingOfTheMountains = Self("KING_OF_THE_MOUNTAINS")
    static let leaderAfterStage = Self("LEADER_AFTER_STAGE")
    static let line = Self("LINE")
    static let makeMissCut = Self("MAKE/MISS_CUT")
    static let matchBetting = Self("MATCH_BETTING")
    static let matchHandicap3Way = Self("MATCH_HANDICAP_(3-WAY)")
    static let matchOdds = Self("MATCH_ODDS")
    static let moneyLine = Self("MONEY_LINE")
    static let nonSport = Self("NONSPORT")
    static let outrightBetting = Self("OUTRIGHT_BETTING")
    static let outrightWinner = Self("OUTRIGHT_WINNER")
    static let playerHandicap = Self("PLAYER_HANDICAP")
    static let promotion = Self("PROMOTION")
    static let secondRoundLeader = Self("SECOND_ROUND_LEADER")
    static let singles = Self("SINGLES")
    static let sixtyMinuteLine = Self("60_MINUTE_LINE")
    static let snookerMatchBetting = Self("SNOOKER_MATCH_BETTING")
    static let stageBetting = Self("STAGE_BETTING")
    static let standardBet = Self("STANDARD_BET")
    static let teamClassification = Self("TEAM_CLASSIFICATION")
    static let threeBalls = Self("THREE_BALLS")
    static let threeWayMatchBetting = Self("3-WAY_MATCH_BETTING")
    static let thirdRoundLeader = Self("THIRD_ROUND_LEADER")
    static let toLiftTheCup = Self("TO_LIFT_THE_CUP")
    static let toLiftTheTrophy = Self("TO_LIFT_THE_TROPHY")
    static let toQualify = Self("TO_QUALIFY")
    static let toQualifyForTheNextRound = Self("TO_QUALIFY_FOR_THE_NEXT_ROUND")
    static let toQualifyInNormalTime = Self("TO_QUALIFY_IN_NORMAL_TIME")
    static let topRegion = Self("TOP_REGION")
    static let twoBalls = Self("TWO_BALLS")
    static let win = Self("WIN")
    static let winDrawWin = Self("WIN-DRAW-WIN")
    static let winner = Self("WINNER")
    static let winnerWithoutX = Self("WINNER_WITHOUT_X")

}

extension MarketType {

    static func primaryMarketTypes(forSport sportID: Sport.ID) -> [MarketType]? {
        eventTypesPrimaryMarkets[sportID]
    }

    private static let eventTypesPrimaryMarkets: [Sport.ID: [MarketType]] = [
        .americanFootball: [.moneyLine, .matchBetting],
        .australianRules: [.headToHead],
        .badminton: [.matchBetting],
        .baseball: [.moneyLine],
        .basketball: [.moneyLine, .matchBetting],
        .beachVolleyball: [.matchBetting],
        .boxing: [.boxingMatchBetting],
        .bowls: [.matchBetting],
        .chess: [.matchBetting],
        .cricket: [.matchBetting],
        .cycling: [.stageBetting, .kingOfTheMountains, .teamClassification, .davisToSantaRosa, .leaderAfterStage],
        .darts: [.matchBetting],
        .eSports: [.matchBetting],
        .fishing: [.win],
        .futsal: [.winDrawWin],
        .gaelicGames: [.matchBetting, .handicapBetting, .toQualify],
        .golf: [.outrightBetting, .winner],
        .handball: [.matchBetting],
        .iceHockey: [.threeWayMatchBetting, .sixtyMinuteLine],
        .internationalRules: [.matchBetting],
        .mixedMartialArts: [.matchBetting],
        .motorSport: [.win],
        .netball: [.headToHead],
        .pool: [.matchBetting],
        .rugbyLeague: [.matchBetting],
        .rugbyUnion: [.matchBetting],
        .snooker: [.snookerMatchBetting, .winDrawWin, .handicapBetting],
        .soccer: [.winDrawWin, .extraTimeBetting, .toLiftTheCup, .toQualifyInNormalTime, .toQualifyForTheNextRound],
        .specialBets: [.winner],
        .squash: [.matchBetting],
        .tableTennis: [.matchBetting],
        .tennis: [.matchBetting],
        .volleyball: [.matchBetting],
        .waterPolo: [.matchBetting]
    ]

}
