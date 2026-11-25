import Proving.USC.Common.Types
import Proving.USC.T18.Ch75.Reslice.Procedure.Types

set_option autoImplicit false










namespace Proving.USC.T18.Ch75.Reslice.Procedure

open Proving.USC.Common





axiom ApplicationForPassportSubmitted (d : TravelDocument) (c : ComplaintText) : Prop





axiom PassportIssuedUnderUSAuthority (d : TravelDocument) (c : ComplaintText) : Prop






axiom IssuanceSecuredByFalseStatement (d : TravelDocument) (c : ComplaintText) : Prop






axiom ContraryToPassportIssuanceRules (d : TravelDocument) (c : ComplaintText) : Prop





axiom PassportVoidedByPrescribedCondition (d : TravelDocument) (c : ComplaintText) : Prop





axiom DocumentTimelineFound (d : TravelDocument) (tl : DocumentTimeline)
    (c : ComplaintText) : Prop







axiom DocumentUsedOrPresented (d : TravelDocument) (c : ComplaintText) : Prop





axiom DocumentFurnishedForUseByAnother (d : TravelDocument) (c : ComplaintText) : Prop





axiom DocumentDesignatedForUseOfAnother (d : TravelDocument) (c : ComplaintText) : Prop





axiom UsedInViolationOfDocumentConditions (d : TravelDocument) (c : ComplaintText) : Prop





axiom DocumentPrescribedByStatuteOrRegulation (d : TravelDocument)
    (c : ComplaintText) : Prop






axiom ControlsBlankPermitOrPrintingPlate (d : TravelDocument)
    (c : ComplaintText) : Prop




axiom DocumentNotLawfullyIssuedForPossessor (d : TravelDocument)
    (c : ComplaintText) : Prop







axiom FilingRequiredByImmigrationLaws (f : ImmigrationFiling)
    (c : ComplaintText) : Prop





axiom SwornOrSubscribedUnderPenaltyOfPerjury (f : ImmigrationFiling)
    (c : ComplaintText) : Prop




axiom FilingPresentedToAuthority (f : ImmigrationFiling) (c : ComplaintText) : Prop




axiom FilingLacksReasonableBasisInLawOrFact (f : ImmigrationFiling)
    (c : ComplaintText) : Prop




axiom FalseAttestationMade (f : ImmigrationFiling) (c : ComplaintText) : Prop








axiom AppearedUnderUndisclosedIdentityAtApplication (p : Person)
    (c : ComplaintText) : Prop







axiom ProsecutionCommenced (pr : Prosecution) (c : ComplaintText) : Prop




axiom AdjudicatedGuilty (pr : Prosecution) (c : ComplaintText) : Prop




axiom SentenceImposed (pr : Prosecution) (c : ComplaintText) : Prop




axiom FineImposedUnderThisTitle (pr : Prosecution) (c : ComplaintText) : Prop




axiom ImprisonmentImposed (pr : Prosecution) (c : ComplaintText) : Prop







axiom SentencingFactsFound (pr : Prosecution) (sf : SentencingFacts)
    (c : ComplaintText) : Prop





axiom UnderDirectionOfProperOfficer (pr : Prosecution) (c : ComplaintText) : Prop







axiom LawfullyAuthorizedAgencyActivity (pr : Prosecution) (c : ComplaintText) : Prop





axiom UsedToSatisfySection274ABRequirement (pr : Prosecution)
    (c : ComplaintText) : Prop

end Proving.USC.T18.Ch75.Reslice.Procedure
