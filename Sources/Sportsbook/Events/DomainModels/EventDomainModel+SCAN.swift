import Foundation
import GBP

extension EventDomainModel {

    init(attachment: EventAttachment, facets: [FacetResultNode]) {
        let eventFacetedValue = facets
            .first { $0.type == .event }?
            .values
            .first { $0.key?.eventId == attachment.eventId }

        let isInPlayFacet = eventFacetedValue?.next?.type == .inPlay ? eventFacetedValue?.next : nil
        let isInPlayFacetedValue = isInPlayFacet?.values.first
        let isInPlay = isInPlayFacetedValue?.value == "true"

        let canTurnInPlayFacet = isInPlayFacetedValue?.next?.type == .canTurnInPlay ? isInPlayFacetedValue?.next : nil
        let canTurnInPlayFacetedValue = canTurnInPlayFacet?.values.first
        let canTurnInPlay = canTurnInPlayFacetedValue?.value == "true"

        self.init(id: attachment.eventId, name: attachment.name, eventTypeID: attachment.eventTypeId,
                  competitionID: attachment.competitionId, countryCode: attachment.countryCode,
                  timeZone: attachment.timezone, openDate: attachment.openDate,
                  isVideoAvailable: attachment.videoAvailable, isInPlay: isInPlay, canTurnInPlay: canTurnInPlay)
    }

}
