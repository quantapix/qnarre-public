





import Proving.USC.Common.Types
import Proving.USC.T42.EqualRights.Reslice.Remedy.Types
import Proving.USC.T42.EqualRights.Reslice.Remedy.Predicates
import Proving.USC.T42.EqualRights.Reslice.Remedy.Statute

set_option autoImplicit false

namespace Proving.USC.T42.EqualRights.Reslice.Remedy

open Proving.USC.Common



theorem standingChain_intro {p d : Person} {c : ComplaintText}
    (hInj : InjuryCognizable p c) (hCaus : CausedByViolation p d c)
    (hRed : Redressable p c) : StandingChain p d c :=
  ⟨hInj, hCaus, hRed⟩



theorem remedyAvailable1981_intro {p d : Person} {c : ComplaintText}
    (hPR : HasPrivateRightOfAction1981 p c)
    (hReach : ImpairmentReachable1981 d c)
    (hStand : StandingChain p d c) : RemedyAvailable1981 p d c :=
  ⟨hPR, hReach, hStand⟩


theorem impairmentReachable1981_of_nongovernmental {d : Person} {c : ComplaintText}
    (h : NongovernmentalImpairment1981 d c) : ImpairmentReachable1981 d c :=
  Or.inl h


theorem impairmentReachable1981_of_underColorOfStateLaw {d : Person} {c : ComplaintText}
    (h : UnderColorOfStateLawImpairment1981 d c) : ImpairmentReachable1981 d c :=
  Or.inr h



theorem predicate1981a_titleVII_intro {p d : Person} {c : ComplaintText}
    (hAction : ActionUnderTitleVIIEnforcement1981a p c)
    (hIntent : IntentionalDiscriminationNotDisparateImpact d c)
    (hNo1981 : CannotRecoverUnder1981 p c) : Predicate1981a p d c :=
  .titleVII hAction hIntent hNo1981

theorem predicate1981a_adaOrRehab_intro {p d : Person} {c : ComplaintText}
    (hAction : ActionUnderAdaOrRehabEnforcement1981a p c)
    (hViol : Violation1981aAdaRehab d c) : Predicate1981a p d c :=
  .adaOrRehab hAction hViol

theorem compensatoryDamagesAvailable1981a_intro {p d : Person} {c : ComplaintText}
    (hParty : IsComplainingParty1981a p c)
    (hPred : Predicate1981a p d c)
    (hNoBar : ¬ AccommodationGoodFaithBar1981a d c) :
    CompensatoryDamagesAvailable1981a p d c :=
  ⟨hParty, hPred, hNoBar⟩

theorem punitiveDamagesAvailable1981a_intro {p d : Person} {c : ComplaintText}
    (hComp : CompensatoryDamagesAvailable1981a p d c)
    (hMalice : MaliceOrRecklessIndifference d c)
    (hNotGov : ¬ RespondentIsGovernmentalEntity d c) :
    PunitiveDamagesAvailable1981a p d c :=
  ⟨hComp, hMalice, hNotGov⟩

theorem cappedRecovery1981a_intro {p d : Person} {t : CapTier} {c : ComplaintText}
    (hAward : CompensatoryDamagesAvailable1981a p d c)
    (hTier : RespondentInCapTier1981a d t c) : CappedRecovery1981a p d t c :=
  ⟨hAward, hTier⟩

theorem juryTrialRight1981a_intro {p : Person} {c : ComplaintText}
    (h : SeeksCompensatoryOrPunitiveDamages1981a p c) : JuryTrialRight1981a p c :=
  ⟨h⟩






theorem compensatoryDamagesAvailable1981a_barred_goodFaith
    {p d : Person} {c : ComplaintText}
    (hAcc : AccommodationClaimUnderAdaOrRehab1981a c)
    (hGF : GoodFaithAccommodationEffort1981a d c) :
    ¬ CompensatoryDamagesAvailable1981a p d c :=
  fun h => h.noGoodFaithBar ⟨hAcc, hGF⟩



theorem punitiveDamagesAvailable1981a_barred_goodFaith
    {p d : Person} {c : ComplaintText}
    (hAcc : AccommodationClaimUnderAdaOrRehab1981a c)
    (hGF : GoodFaithAccommodationEffort1981a d c) :
    ¬ PunitiveDamagesAvailable1981a p d c :=
  fun h => compensatoryDamagesAvailable1981a_barred_goodFaith hAcc hGF h.compensatoryBase





theorem punitiveDamagesAvailable1981a_barred_government
    {p d : Person} {c : ComplaintText}
    (hGov : RespondentIsGovernmentalEntity d c) :
    ¬ PunitiveDamagesAvailable1981a p d c :=
  fun h => h.notGovernment hGov



theorem remedyAvailable1982_intro {p d : Person} {c : ComplaintText}
    (hPR : HasPrivateRightOfAction1982 p c)
    (hCitizen : IsCitizenOfUnitedStates p c)
    (hStand : StandingChain p d c) : RemedyAvailable1982 p d c :=
  ⟨hPR, hCitizen, hStand⟩



theorem remedyAvailable1983_intro {p d : Person} {c : ComplaintText}
    (hLiab : LiableToPartyInjured1983 p d c)
    (hInjured : IsPartyInjured1983 p c)
    (hStand : StandingChain p d c) : RemedyAvailable1983 p d c :=
  ⟨hLiab, hInjured, hStand⟩

theorem injunctiveReliefAvailable1983_intro {p d : Person} {c : ComplaintText}
    (hBase : RemedyAvailable1983 p d c)
    (hNotBarred :
      ¬ JudicialOfficerActingJudicially d c ∨ JudicialOfficerEscape1983 p d c) :
    InjunctiveReliefAvailable1983 p d c :=
  ⟨hBase, hNotBarred⟩



theorem injunctiveReliefAvailable1983_of_notJudicialOfficer
    {p d : Person} {c : ComplaintText}
    (hBase : RemedyAvailable1983 p d c)
    (hNot : ¬ JudicialOfficerActingJudicially d c) :
    InjunctiveReliefAvailable1983 p d c :=
  ⟨hBase, Or.inl hNot⟩




theorem injunctiveReliefAvailable1983_of_escape
    {p d : Person} {c : ComplaintText}
    (hBase : RemedyAvailable1983 p d c)
    (hEscape : JudicialOfficerEscape1983 p d c) :
    InjunctiveReliefAvailable1983 p d c :=
  ⟨hBase, Or.inr hEscape⟩

theorem judicialOfficerEscape1983_of_decreeViolated {p d : Person} {c : ComplaintText}
    (h : DeclaratoryDecreeViolated1983 d c) : JudicialOfficerEscape1983 p d c :=
  Or.inl h

theorem judicialOfficerEscape1983_of_declaratoryUnavailable
    {p d : Person} {c : ComplaintText}
    (h : DeclaratoryReliefUnavailable1983 p c) : JudicialOfficerEscape1983 p d c :=
  Or.inr h





theorem injunctiveReliefAvailable1983_barred_judicialOfficer
    {p d : Person} {c : ComplaintText}
    (hJ : JudicialOfficerActingJudicially d c)
    (hNoEscape : ¬ JudicialOfficerEscape1983 p d c) :
    ¬ InjunctiveReliefAvailable1983 p d c :=
  fun h => h.notBarred.elim (fun hn => hn hJ) hNoEscape



theorem relief1983Route_atLaw_survives_judicialOfficer
    {p d : Person} {c : ComplaintText}
    (hBase : RemedyAvailable1983 p d c)
    (_hJ : JudicialOfficerActingJudicially d c) : Relief1983Route p d c :=
  .atLaw hBase

theorem relief1983Route_atLaw_intro {p d : Person} {c : ComplaintText}
    (h : RemedyAvailable1983 p d c) : Relief1983Route p d c := .atLaw h

theorem relief1983Route_injunctive_intro {p d : Person} {c : ComplaintText}
    (h : InjunctiveReliefAvailable1983 p d c) : Relief1983Route p d c := .injunctive h

theorem relief1983Route_otherProceeding_intro {p d : Person} {c : ComplaintText}
    (h : RemedyAvailable1983 p d c) : Relief1983Route p d c := .otherProceeding h



theorem remedyAvailable1985_intro {p d : Person} {c : ComplaintText}
    (hConsp : IsConspirator1985 d c)
    (hAct : OvertActInFurtherance1985 c)
    (hHarm : CognizableHarm1985 p c)
    (hOcc : InjuryOccasionedByConspiracy1985 p c) : RemedyAvailable1985 p d c :=
  ⟨hConsp, hAct, hHarm, hOcc⟩

theorem cognizableHarm1985_of_personOrProperty {p : Person} {c : ComplaintText}
    (h : InjuredInPersonOrProperty1985 p c) : CognizableHarm1985 p c := Or.inl h

theorem cognizableHarm1985_of_deprivation {p : Person} {c : ComplaintText}
    (h : DeprivedOfRightOrPrivilege1985 p c) : CognizableHarm1985 p c := Or.inr h



theorem remedyAvailable1986_intro {p d : Person} {c : ComplaintText}
    (hKnow : KnowledgeOfImpendingSection1985Wrong1986 d c)
    (hPower : PowerToPreventOrAid1986 d c)
    (hNeglect : NeglectedOrRefusedToPrevent1986 d c)
    (hWrong : WrongfulActCommitted1986 c)
    (hInjured : IsPartyInjuredOrLegalRepresentative1986 p c)
    (hPrevent : PreventableByReasonableDiligence1986 d c)
    (hTimely : CommencedWithinOneYearOfAccrual1986 p c) : RemedyAvailable1986 p d c :=
  ⟨hKnow, hPower, hNeglect, hWrong, hInjured, hPrevent, hTimely⟩


theorem commencedWithinOneYearOfAccrual1986_of_dayCount {p : Person} {c : ComplaintText}
    (h : WithinOneYearByDayCount1986 p c) : CommencedWithinOneYearOfAccrual1986 p c :=
  dayCountImpliesWithinOneYear1986 p c h



theorem remedyAvailable1986_barred_untimely {p d : Person} {c : ComplaintText}
    (hLate : ¬ CommencedWithinOneYearOfAccrual1986 p c) : ¬ RemedyAvailable1986 p d c :=
  fun h => hLate h.timely

theorem wrongfulDeathRecovery1986_intro {p d : Person} {c : ComplaintText}
    (hBase : RemedyAvailable1986 p d c)
    (hDeath : DeathCausedByWrongfulActAndNeglect1986 c)
    (hRep : IsLegalRepresentativeOfDeceased1986 p c)
    (hBen : HasWidowOrNextOfKinBeneficiary1986 c) : WrongfulDeathRecovery1986 p d c :=
  ⟨hBase, hDeath, hRep, hBen⟩



theorem remedialLawSource1988a_federal_intro {c : ComplaintText}
    (h : FederalLawSuitableToCarryIntoEffect1988a c) : RemedialLawSource1988a c :=
  .federal h

theorem remedialLawSource1988a_stateGapFill_intro {c : ComplaintText}
    (hDef : FederalLawDeficientInSuitableRemedies1988a c)
    (hOk : StateCommonLawNotInconsistentWithFederalLaw1988a c) :
    RemedialLawSource1988a c :=
  .stateGapFill hDef hOk

theorem attorneysFeeAvailable1988b_intro {p d : Person} {c : ComplaintText}
    (hCovered : ActionToEnforceCoveredProvision1988b c)
    (hPrevail : IsPrevailingParty p c)
    (hNotUS : ¬ IsUnitedStatesAsParty p c)
    (hNotImmune :
      ¬ JudicialOfficerActingJudicially d c ∨ ActionClearlyInExcessOfJurisdiction1988b c) :
    AttorneysFeeAvailable1988b p d c :=
  ⟨hCovered, hPrevail, hNotUS, hNotImmune⟩



theorem attorneysFeeAvailable1988b_of_notJudicialOfficer
    {p d : Person} {c : ComplaintText}
    (hCovered : ActionToEnforceCoveredProvision1988b c)
    (hPrevail : IsPrevailingParty p c)
    (hNotUS : ¬ IsUnitedStatesAsParty p c)
    (hNot : ¬ JudicialOfficerActingJudicially d c) :
    AttorneysFeeAvailable1988b p d c :=
  ⟨hCovered, hPrevail, hNotUS, Or.inl hNot⟩




theorem attorneysFeeAvailable1988b_barred_judicialOfficer
    {p d : Person} {c : ComplaintText}
    (hJ : JudicialOfficerActingJudicially d c)
    (hNotExcess : ¬ ActionClearlyInExcessOfJurisdiction1988b c) :
    ¬ AttorneysFeeAvailable1988b p d c :=
  fun h => h.notImmuneOfficer.elim (fun hn => hn hJ) hNotExcess



theorem attorneysFeeAvailable1988b_barred_unitedStates
    {p d : Person} {c : ComplaintText}
    (hUS : IsUnitedStatesAsParty p c) : ¬ AttorneysFeeAvailable1988b p d c :=
  fun h => h.notUnitedStates hUS

theorem expertFeesIncludable1988c_intro {p d : Person} {c : ComplaintText}
    (hFee : AttorneysFeeAvailable1988b p d c)
    (hUnderlying : ActionToEnforce1981Or1981a1988c c) :
    ExpertFeesIncludable1988c p d c :=
  ⟨hFee, hUnderlying⟩


theorem expertFeesIncludable1988c_implies_feeAward {p d : Person} {c : ComplaintText}
    (h : ExpertFeesIncludable1988c p d c) : AttorneysFeeAvailable1988b p d c :=
  h.feeAward



theorem expertFeesIncludable1988c_requires1981Or1981a {p d : Person} {c : ComplaintText}
    (h : ExpertFeesIncludable1988c p d c) : ActionToEnforce1981Or1981a1988c c :=
  h.underlying


theorem expertFeesIncludable1988c_implies_covered1988b {p d : Person} {c : ComplaintText}
    (h : ExpertFeesIncludable1988c p d c) : ActionToEnforceCoveredProvision1988b c :=
  enforce1981Or1981aIsCovered1988b c h.underlying

end Proving.USC.T42.EqualRights.Reslice.Remedy
