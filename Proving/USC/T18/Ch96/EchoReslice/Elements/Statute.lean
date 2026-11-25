import Proving.USC.Common.Types
import Proving.USC.T18.Ch96.EchoReslice.Elements.Types
import Proving.USC.T18.Ch96.EchoReslice.Elements.Predicates

set_option autoImplicit false









namespace Proving.USC.T18.Ch96.EchoReslice.Elements

open Proving.USC.Common





def ConsiderationPrecededDetermination
    (ct : Court) (pr : Proceeding) (c : ComplaintText) : Prop :=
  dayOfRightsConsideration ct pr c ≤ dayOfAccessDetermination ct pr c




structure QualifyingUnitedStatesAction (a : CivilAction) (c : ComplaintText) : Prop where
  institutedByUnitedStates : IsCivilActionInstitutedByUnitedStates a c
  underChapter96 : ArisesUnderChapter96 a c



inductive ProceedingWithinSection1967
    (pr : Proceeding) (a : CivilAction) (c : ComplaintText) : Prop where

  | ancillary (hq : QualifyingUnitedStatesAction a c) (h : IsAncillaryProceeding pr a c)

  | theAction (hq : QualifyingUnitedStatesAction a c) (h : ProceedingIsTheCivilAction pr a c)


structure PersonRightsConsidered
    (ct : Court) (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop where
  affected : RightsOfPersonAffected p pr c
  considered : CourtConsideredRightsOfPerson ct p pr c




structure RightsConsideration
    (ct : Court) (pr : Proceeding) (persons : List Person) (c : ComplaintText) : Prop where
  identified : AffectedPersonsIdentified pr persons c
  eachConsidered : ∀ p ∈ persons, PersonRightsConsidered ct p pr c
  precededDetermination : ConsiderationPrecededDetermination ct pr c




inductive PublicAccessDisposition (pr : Proceeding) (c : ComplaintText) : Prop where

  | opened (h : ProceedingsOpenToPublic pr c)

  | closed (h : ProceedingsClosedToPublic pr c)



structure Section1967
    (ct : Court) (pr : Proceeding) (a : CivilAction) (persons : List Person)
    (c : ComplaintText) : Prop where
  within : ProceedingWithinSection1967 pr a c
  presiding : IsPresidingCourt ct pr c
  consideration : RightsConsideration ct pr persons c
  withinDiscretion : DeterminationWithinCourtDiscretion ct pr c
  disposition : PublicAccessDisposition pr c





inductive Section1967Standing
    (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop where

  | party (h : IsPartyToProceeding p pr c)


  | affectedPerson (h : RightsOfPersonAffected p pr c)



structure Section1967AccessClaim
    (ct : Court) (p : Person) (pr : Proceeding) (a : CivilAction)
    (persons : List Person) (c : ComplaintText) : Prop where
  section1967 : Section1967 ct pr a persons c
  standing : Section1967Standing p pr c

end Proving.USC.T18.Ch96.EchoReslice.Elements
