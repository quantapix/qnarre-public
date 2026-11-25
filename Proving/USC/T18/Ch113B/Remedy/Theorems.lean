






import Proving.USC.T18.Ch113B.Remedy.Types
import Proving.USC.T18.Ch113B.Remedy.Predicates
import Proving.USC.T18.Ch113B.Remedy.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Remedy

open Proving.USC.Common






theorem standing2333a_intro {p : Person} {c : ComplaintText}
    (hPR : HasPrivateRightOfAction p c)
    (hNat : IsNationalOfTheUnitedStates p c)
    (hInj : InjuryCognizable p c)
    (hAct : IsActOfInternationalTerrorism c)
    (hCaus : CausedByViolation p c) : Standing2333a p c :=
  ⟨hPR, hNat, hInj, hAct, hCaus⟩



theorem derivativeStanding2333a_intro {p q : Person} {c : ComplaintText}
    (hStanding : Standing2333a q c)
    (hRel : IsEstateSurvivorOrHeir p q c) : DerivativeStanding2333a p q c :=
  ⟨hStanding, hRel⟩


theorem claimant2333a_intro {p : Person} {c : ComplaintText}
    (h : Standing2333a p c) : Claimant2333a p c :=
  .direct h


theorem claimant2333a_intro_derivative {p q : Person} {c : ComplaintText}
    (h : DerivativeStanding2333a p q c) : Claimant2333a p c :=
  .derivative q h




theorem remedyAvailable2333a_intro {p d : Person} {c : ComplaintText}
    (hClaim : Claimant2333a p c)
    (hLiab : LiabilityTheory2333 d c) : RemedyAvailable2333a p d c :=
  ⟨hClaim, hLiab⟩


theorem liabilityTheory2333_intro {d : Person} {c : ComplaintText}
    (h : CommittedActOfInternationalTerrorism d c) : LiabilityTheory2333 d c :=
  .primary h


theorem liabilityTheory2333_intro_secondary
    {d : Person} {o : ForeignTerroristOrganization} {c : ComplaintText}
    (h : SecondaryLiability2333d d o c) : LiabilityTheory2333 d c :=
  .secondary o h




theorem ftoPredicate2333d_intro
    {o : ForeignTerroristOrganization} {c : ComplaintText}
    (hDes : OrganizationDesignatedForeignTerroristOrganization o c)
    (hAttr : ActCommittedPlannedOrAuthorizedByOrganization o c) :
    FtoPredicate2333d o c :=
  ⟨hDes, hAttr⟩



theorem secondaryLiability2333d_intro
    {d : Person} {o : ForeignTerroristOrganization} {c : ComplaintText}
    (hp : FtoPredicate2333d o c)
    (h : AidsAndAbetsByKnowinglyProvidingSubstantialAssistance d c) :
    SecondaryLiability2333d d o c :=
  .aidingAbetting hp h


theorem secondaryLiability2333d_intro_conspiracy
    {d : Person} {o : ForeignTerroristOrganization} {c : ComplaintText}
    (hp : FtoPredicate2333d o c)
    (h : ConspiresWithPersonCommittingAct d c) :
    SecondaryLiability2333d d o c :=
  .conspiracy hp h





theorem estoppel2333b_intro
    {d : Person} {j : CriminalJudgment} {c : ComplaintText}
    (hJ : PriorCriminalJudgmentForUnitedStates j c)
    (hD : DefendantWasDefendantInPriorProceeding d j c) : Estoppel2333b d j c :=
  ⟨hJ, hD⟩



theorem estoppel2333c_intro
    {d : Person} {j : CriminalJudgment} {c : ComplaintText}
    (hJ : PriorCriminalJudgmentForForeignState j c)
    (hF : AccordedFullFaithAndCredit j c)
    (hD : DefendantWasDefendantInPriorProceeding d j c) : Estoppel2333c d j c :=
  ⟨hJ, hF, hD⟩


theorem estoppelAvailable2333_intro
    {d : Person} {j : CriminalJudgment} {c : ComplaintText}
    (h : Estoppel2333b d j c) : EstoppelAvailable2333 d j c :=
  .unitedStates h


theorem estoppelAvailable2333_intro_foreignState
    {d : Person} {j : CriminalJudgment} {c : ComplaintText}
    (h : Estoppel2333c d j c) : EstoppelAvailable2333 d j c :=
  .foreignState h





theorem blockedAssetExecution2333e_intro
    {p d : Person} {a : BlockedAsset} {c : ComplaintText}
    (hJ : HasObtainedJudgmentAgainstTerroristParty p d c)
    (hB : AssetSeizedOrFrozenUnderKingpinAct a d c) :
    BlockedAssetExecution2333e p d a c :=
  ⟨hJ, hB⟩




theorem criminalRemedy2332_intro {d : Person} {c : ComplaintText}
    (hV : ViolatedSection2332 d c)
    (hCert : AttorneyGeneralCertificationFiled d c)
    (hPurp : OffenseIntendedToCoerceIntimidateOrRetaliate d c) :
    CriminalRemedy2332 d c :=
  ⟨hV, hCert, hPurp⟩


theorem criminalRemedy2332a_intro {d : Person} {c : ComplaintText}
    (hV : ViolatedSection2332a d c) : CriminalRemedy2332a d c :=
  ⟨hV⟩


theorem criminalRemedy2332b_intro {d : Person} {c : ComplaintText}
    (hV : ViolatedSection2332b d c)
    (hJ : JurisdictionalNexusEstablished d c) : CriminalRemedy2332b d c :=
  ⟨hV, hJ⟩


theorem criminalRemedy2332d_intro {d : Person} {c : ComplaintText}
    (hV : ViolatedSection2332d d c)
    (hNE : ¬ TreasuryRegulationExemption d c) : CriminalRemedy2332d d c :=
  ⟨hV, hNE⟩


theorem criminalRemedy2332f_intro {d : Person} {c : ComplaintText}
    (hV : ViolatedSection2332f d c)
    (hJ : JurisdictionalNexusEstablished d c)
    (hNA : ¬ ArmedForcesOrMilitaryForcesExclusion d c)
    (hNN : ¬ NationalityOnlyDomesticOffenseExclusion d c) :
    CriminalRemedy2332f d c :=
  ⟨hV, hJ, hNA, hNN⟩


theorem criminalRemedy2332g_intro {d : Person} {c : ComplaintText}
    (hV : ViolatedSection2332g d c)
    (hJ : JurisdictionalNexusEstablished d c)
    (hNA : ¬ UnitedStatesAuthorityOrContractExclusion d c) :
    CriminalRemedy2332g d c :=
  ⟨hV, hJ, hNA⟩


theorem criminalRemedy2332h_intro {d : Person} {c : ComplaintText}
    (hV : ViolatedSection2332h d c)
    (hJ : JurisdictionalNexusEstablished d c)
    (hNA : ¬ UnitedStatesAuthorityOrContractExclusion d c) :
    CriminalRemedy2332h d c :=
  ⟨hV, hJ, hNA⟩


theorem criminalRemedy2332i_intro {d : Person} {c : ComplaintText}
    (hV : ViolatedSection2332i d c)
    (hJ : JurisdictionalNexusEstablished d c)
    (hNA : ¬ ArmedForcesOrMilitaryForcesExclusion d c) :
    CriminalRemedy2332i d c :=
  ⟨hV, hJ, hNA⟩





theorem deathResultEnhancement_intro {d : Person} {c : ComplaintText}
    (h : CriminalRemedy2332a d c)
    (hd : DeathResultedFromViolation d c) : DeathResultEnhancement d c :=
  .s2332a h hd


theorem deathResultEnhancement_intro_s2332b {d : Person} {c : ComplaintText}
    (h : CriminalRemedy2332b d c)
    (hd : DeathResultedFromViolation d c) : DeathResultEnhancement d c :=
  .s2332b h hd


theorem deathResultEnhancement_intro_s2332f {d : Person} {c : ComplaintText}
    (h : CriminalRemedy2332f d c)
    (hd : DeathResultedFromViolation d c) : DeathResultEnhancement d c :=
  .s2332f h hd


theorem deathResultEnhancement_intro_s2332g {d : Person} {c : ComplaintText}
    (h : CriminalRemedy2332g d c)
    (hd : DeathResultedFromViolation d c) : DeathResultEnhancement d c :=
  .s2332g h hd


theorem deathResultEnhancement_intro_s2332h {d : Person} {c : ComplaintText}
    (h : CriminalRemedy2332h d c)
    (hd : DeathResultedFromViolation d c) : DeathResultEnhancement d c :=
  .s2332h h hd





theorem investigativeAuthority2332b_intro {d : Person} {c : ComplaintText}
    (h : IsFederalCrimeOfTerrorism d c) : InvestigativeAuthority2332b d c :=
  ⟨h⟩



theorem militaryAssistance2332e_intro {c : ComplaintText}
    (hE : EmergencyInvolvingWeaponOfMassDestruction c)
    (hR : MilitaryAssistanceRequestedByAttorneyGeneral c) :
    MilitaryAssistance2332e c :=
  ⟨hE, hR⟩

end Proving.USC.T18.Ch113B.Remedy
