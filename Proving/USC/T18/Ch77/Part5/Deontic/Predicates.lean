



import Proving.USC.Common.Types
import Proving.USC.T18.Ch77.Part5.Deontic.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part5.Deontic

open Proving.USC.Common




axiom AddresseeAnyPerson (d : Person) (c : ComplaintText) : Prop





axiom AddresseeSentencingAuthority (s : SentencingAuthority) (c : ComplaintText) : Prop




axiom ActedKnowingly (d : Person) (c : ComplaintText) : Prop





axiom JurisdictionalNexusMet (d : Person) (c : ComplaintText) : Prop





axiom TraffickingActOccurred (d : Person) (v : Person) (c : ComplaintText) : Prop




axiom VentureEngagedInParagraphOneViolation (vn : Venture) (v : Person)
    (c : ComplaintText) : Prop






axiom BenefitFromVentureOccurred (d : Person) (vn : Venture)
    (c : ComplaintText) : Prop






axiom KnewCoerciveMeansWillBeUsed (d : Person) (v : Person)
    (c : ComplaintText) : Prop




axiom RecklesslyDisregardedCoerciveMeans (d : Person) (v : Person)
    (c : ComplaintText) : Prop





axiom KnewVictimUnderEighteen (d : Person) (v : Person)
    (c : ComplaintText) : Prop




axiom RecklesslyDisregardedVictimUnderEighteen (d : Person) (v : Person)
    (c : ComplaintText) : Prop






axiom ActConstitutingViolationIsAdvertising (d : Person)
    (c : ComplaintText) : Prop




axiom ProsecutionUnderSubsectionAOne (c : ComplaintText) : Prop





axiom ReasonableOpportunityToObserve (d : Person) (v : Person)
    (c : ComplaintText) : Prop




axiom ConvictedOfOffenseUnderSubsectionA (d : Person) (v : Person)
    (c : ComplaintText) : Prop






axiom OffenseEffectedByCoerciveMeansOrVictimUnderFourteen (d : Person)
    (v : Person) (c : ComplaintText) : Prop





axiom OffenseNotSoEffectedAndVictimFourteenToSeventeen (d : Person)
    (v : Person) (c : ComplaintText) : Prop





axiom ImposedFineAndImprisonmentFifteenYearsToLife (s : SentencingAuthority)
    (d : Person) (c : ComplaintText) : Prop




axiom ImposedFineAndImprisonmentTenYearsToLife (s : SentencingAuthority)
    (d : Person) (c : ComplaintText) : Prop




axiom EnforcementOfSectionAtIssue (c : ComplaintText) : Prop




axiom ObstructionActOccurred (d : Person) (c : ComplaintText) : Prop




axiom ConvictedOfOffenseUnderSubsectionD (d : Person) (c : ComplaintText) : Prop




axiom ImposedFineOrImprisonmentNotExceedingTwentyFiveYears
    (s : SentencingAuthority) (d : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch77.Part5.Deontic
