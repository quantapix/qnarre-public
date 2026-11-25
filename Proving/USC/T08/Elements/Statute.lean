







import Proving.USC.T08.Elements.Predicates
import Proving.USC.Common.Predicates

namespace Proving.USC.T08.Elements
open Proving.USC.Common





structure BringingInImproperPlace (p a : Person) (c : ComplaintText) : Prop where
  alien        : IsAlien a c
  knowsAlien   : KnowsPersonIsAlien p c
  brings       : BringsOrAttemptsToBringToUS p c
  undesignated : AtPlaceOtherThanDesignated p c



structure TransportingWithinUS (p a : Person) (c : ComplaintText) : Prop where
  alien       : IsAlien a c
  scienter    : KnowsOrRecklessUnlawfulPresence p c
  transports  : TransportsOrMovesWithinUS p c
  furtherance : InFurtheranceOfUnlawfulPresence p c




structure HarboringAlien (p a : Person) (c : ComplaintText) : Prop where
  alien       : IsAlien a c
  scienter    : KnowsOrRecklessUnlawfulPresence p c
  harbors     : ConcealsHarborsOrShields p c
  notReligious : ¬ ReligiousWorkerException p c




structure EncouragingEntry (p a : Person) (c : ComplaintText) : Prop where
  alien        : IsAlien a c
  encourages   : EncouragesOrInducesEntry p c
  scienter     : KnowsOrRecklessEntryUnlawful p c
  notReligious : ¬ ReligiousWorkerException p c



structure BringingInUnauthorized (p a : Person) (c : ComplaintText) : Prop where
  alien    : IsAlien a c
  scienter : KnowsNoPriorAuthorization p c
  brings   : BringsOrAttemptsToBringToUS p c




structure UnlawfulEmploymentOfAliens (p : Person) (c : ComplaintText) : Prop where
  hires     : HiresTenOrMoreInTwelveMonths p c
  knowledge : ActualKnowledgeIndividualsAreUnauthorizedAliens p c



inductive ConspiresOrAids (p a : Person) (ag : Agreement) (c : ComplaintText) : Prop where
  | conspiracy (h : AgreementAmongTwoOrMore ag c)
  | aiding     (h : AidsOrAbetsOffense p c)


inductive ViolatesSection1324 (p a : Person) (ag : Agreement) (c : ComplaintText) : Prop where
  | bringingImproper    (h : BringingInImproperPlace p a c)
  | transporting        (h : TransportingWithinUS p a c)
  | harboring           (h : HarboringAlien p a c)
  | encouraging         (h : EncouragingEntry p a c)
  | conspiracyOrAiding  (h : ConspiresOrAids p a ag c)
  | bringingUnauthorized (h : BringingInUnauthorized p a c)
  | unlawfulEmployment  (h : UnlawfulEmploymentOfAliens p c)





structure AidingInadmissibleAlienEntry (p a : Person) (c : ComplaintText) : Prop where
  inadmissible : AlienInadmissibleCriminalOrSecurity a c
  aids         : KnowinglyAidsOrAssistsEntry p c



structure ConnivingInadmissibleAlienEntry (p a : Person) (c : ComplaintText) : Prop where
  inadmissible : AlienInadmissibleCriminalOrSecurity a c
  connives     : ConnivesOrConspiresToAllowEntry p c


inductive ViolatesSection1327 (p a : Person) (c : ComplaintText) : Prop where
  | aiding    (h : AidingInadmissibleAlienEntry p a c)
  | conniving (h : ConnivingInadmissibleAlienEntry p a c)





structure ImportingForImmoralPurpose (p a : Person) (c : ComplaintText) : Prop where
  alien   : IsAlien a c
  imports : ImportsOrAttemptsToImportAlien p c
  purpose : ForProstitutionOrImmoralPurpose p c



structure HoldingForImmoralPurpose (p a : Person) (c : ComplaintText) : Prop where
  alien     : IsAlien a c
  holds     : HoldsAlienForImmoralPurpose p c
  purpose   : ForProstitutionOrImmoralPurpose p c
  pursuance : InPursuanceOfIllegalImportation p c




structure HarboringForImmoralPurpose (p a : Person) (c : ComplaintText) : Prop where
  alien     : IsAlien a c
  keeps     : KeepsMaintainsOrHarborsForImmoralPurpose p c
  purpose   : ForProstitutionOrImmoralPurpose p c
  pursuance : InPursuanceOfIllegalImportation p c


inductive ViolatesSection1328 (p a : Person) (c : ComplaintText) : Prop where
  | importing (h : ImportingForImmoralPurpose p a c)
  | holding   (h : HoldingForImmoralPurpose p a c)
  | harboring (h : HarboringForImmoralPurpose p a c)

end Proving.USC.T08.Elements
