import Foundation
import SCAN

extension EventDomainModel {

    init?(attachment: EventAttachment, facets: [FacetResultNode]) {
        guard let attachmentName = attachment.name else {
            return nil
        }

        let eventFacetedValue = facets
            .first { $0.type == .event }?
            .values
            .first { $0.key?.eventID == attachment.eventID }

        let isInPlayFacet = eventFacetedValue?.next?.type == .inPlay ? eventFacetedValue?.next : nil
        let isInPlayFacetedValue = isInPlayFacet?.values.first
        let isInPlay = isInPlayFacetedValue?.value == "true"

        let canTurnInPlayFacet = isInPlayFacetedValue?.next?.type == .canTurnInPlay ? isInPlayFacetedValue?.next : nil
        let canTurnInPlayFacetedValue = canTurnInPlayFacet?.values.first
        let canTurnInPlay = canTurnInPlayFacetedValue?.value == "true"

        self.init(id: attachment.eventID, name: attachmentName, sportID: attachment.eventTypeID,
                  competitionID: attachment.competitionID, countryCode: attachment.countryCode,
                  timeZone: attachment.timezone, openDate: attachment.openDate,
                  isVideoAvailable: attachment.videoAvailable, isInPlay: isInPlay, canTurnInPlay: canTurnInPlay)
    }

}
