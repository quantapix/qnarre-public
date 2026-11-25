import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch77.Part4.Elements.Types
import Proving.USC.T18.Ch77.Part4.Elements.Predicates
import Proving.USC.T18.Ch77.Part4.Elements.Statute

set_option autoImplicit false










namespace Proving.USC.T18.Ch77.Part4.Elements

open Proving.USC.Common



theorem abuseOfLegalProcess1591e1_intro {d v : Person} {c : ComplaintText}
    (hUse : UsesOrThreatensLegalProcess d v c)
    (hPurpose : UsesLegalProcessForPurposeNotDesigned d v c)
    (hPressure : ExertsPressureToCauseOrPreventAction d v c) :
    AbuseOfLegalProcess1591e1 d v c :=
  ⟨hUse, hPurpose, hPressure⟩

theorem seriousHarm1591e5_intro {v : Person} {c : ComplaintText}
    (hHarm : HarmThreatenedOrInflicted v c)
    (hCompel : SufficientlySeriousToCompelReasonablePerson v c) :
    SeriousHarm1591e5 v c :=
  ⟨hHarm, hCompel⟩



theorem coercion1591e2_intro_threatsOfSeriousHarm {d v : Person} {c : ComplaintText}
    (h : ThreatensSeriousHarmToAnyPerson d v c) (hs : SeriousHarm1591e5 v c) :
    Coercion1591e2 d v c :=
  .threatsOfSeriousHarm h hs

theorem coercion1591e2_intro_physicalRestraint {d v : Person} {c : ComplaintText}
    (h : ThreatensOrUsesPhysicalRestraint d v c) : Coercion1591e2 d v c :=
  .physicalRestraint h

theorem coercion1591e2_intro_schemePlanOrPattern {d v : Person} {c : ComplaintText}
    (h : EmploysSchemeCausingBeliefOfSeriousHarm d v c) (hs : SeriousHarm1591e5 v c) :
    Coercion1591e2 d v c :=
  .schemePlanOrPattern h hs

theorem coercion1591e2_intro_abuseOfLegalProcess {d v : Person} {c : ComplaintText}
    (h : AbuseOfLegalProcess1591e1 d v c) : Coercion1591e2 d v c :=
  .abuseOfLegalProcess h



theorem meansOfCompulsion1591_intro_force {d v : Person} {c : ComplaintText}
    (h : UsesForce d v c) : MeansOfCompulsion1591 d v c := .force h

theorem meansOfCompulsion1591_intro_threatsOfForce {d v : Person} {c : ComplaintText}
    (h : ThreatensForce d v c) : MeansOfCompulsion1591 d v c := .threatsOfForce h

theorem meansOfCompulsion1591_intro_fraud {d v : Person} {c : ComplaintText}
    (h : UsesFraud d v c) : MeansOfCompulsion1591 d v c := .fraud h

theorem meansOfCompulsion1591_intro_coercion {d v : Person} {c : ComplaintText}
    (h : Coercion1591e2 d v c) : MeansOfCompulsion1591 d v c := .coercion h



theorem venture1591e6_intro {ven : Venture} {c : ComplaintText}
    (hCount : 2 ≤ ventureMemberCount ven c)
    (hAssoc : MembersAssociatedInFact ven c) : Venture1591e6 ven c :=
  ⟨hCount, hAssoc⟩



theorem jurisdictionalNexus1591a1_intro_commerce
    {act : TraffickingAct} {c : ComplaintText}
    (h : InOrAffectingInterstateOrForeignCommerce act c) :
    JurisdictionalNexus1591a1 act c := .commerce h

theorem jurisdictionalNexus1591a1_intro_maritimeTerritorial
    {act : TraffickingAct} {c : ComplaintText}
    (h : WithinSpecialMaritimeAndTerritorialJurisdiction act c) :
    JurisdictionalNexus1591a1 act c := .maritimeTerritorial h

theorem paragraphOneConduct_intro
    {d : Person} {act : TraffickingAct} {v : Person} {c : ComplaintText}
    (hJur : JurisdictionalNexus1591a1 act c)
    (hAct : PerformsProhibitedTraffickingAct d act v c) :
    ParagraphOneConduct d act v c :=
  ⟨hJur, hAct⟩

theorem paragraphTwoConduct_intro
    {d : Person} {ven : Venture} {act : TraffickingAct} {c : ComplaintText}
    (hBenefit : BenefitsFinanciallyOrReceivesValue d ven c)
    (hVenture : Venture1591e6 ven c)
    (hParticipation : ParticipatesInVenture d ven c)
    (hPredicate : VentureEngagedInParagraphOneAct ven act c) :
    ParagraphTwoConduct d ven act c :=
  ⟨hBenefit, hVenture, hParticipation, hPredicate⟩

theorem conduct1591a_intro_paragraphOne
    {d : Person} {ven : Venture} {act : TraffickingAct} {v : Person} {c : ComplaintText}
    (h : ParagraphOneConduct d act v c) : Conduct1591a d ven act v c := .paragraphOne h

theorem conduct1591a_intro_paragraphTwo
    {d : Person} {ven : Venture} {act : TraffickingAct} {v : Person} {c : ComplaintText}
    (h : ParagraphTwoConduct d ven act c) : Conduct1591a d ven act v c := .paragraphTwo h



theorem mensReaAsToMeans_intro_knowing
    {d : Person} {act : TraffickingAct} {v : Person} {c : ComplaintText}
    (h : KnowsMeansWillBeUsed d v c) : MensReaAsToMeans d act v c := .knowing h

theorem mensReaAsToMeans_intro_reckless
    {d : Person} {act : TraffickingAct} {v : Person} {c : ComplaintText}
    (h : RecklesslyDisregardsMeansWillBeUsed d v c)
    (hNotAdvertising : ¬ ViolationActIsAdvertising act c) :
    MensReaAsToMeans d act v c := .reckless h hNotAdvertising

theorem mensReaAsToAge_intro_knowing
    {d : Person} {act : TraffickingAct} {v : Person} {c : ComplaintText}
    (hUnder18 : VictimUnderEighteen v c)
    (hCaused : WillBeCausedToEngageInCommercialSexAct v c)
    (h : KnowsVictimUnderageAndWillBeCaused d v c) :
    MensReaAsToAge d act v c := .knowing hUnder18 hCaused h

theorem mensReaAsToAge_intro_reckless
    {d : Person} {act : TraffickingAct} {v : Person} {c : ComplaintText}
    (hUnder18 : VictimUnderEighteen v c)
    (hCaused : WillBeCausedToEngageInCommercialSexAct v c)
    (h : RecklesslyDisregardsVictimUnderageAndWillBeCaused d v c)
    (hNotAdvertising : ¬ ViolationActIsAdvertising act c) :
    MensReaAsToAge d act v c := .reckless hUnder18 hCaused h hNotAdvertising

theorem mensReaAsToAge_intro_reasonableOpportunityToObserve
    {d : Person} {act : TraffickingAct} {v : Person} {c : ComplaintText}
    (hUnder18 : VictimUnderEighteen v c)
    (hCaused : WillBeCausedToEngageInCommercialSexAct v c)
    (hConduct : ParagraphOneConduct d act v c)
    (h : HadReasonableOpportunityToObserve d v c) :
    MensReaAsToAge d act v c := .reasonableOpportunityToObserve hUnder18 hCaused hConduct h

theorem mensRea1591a_intro_means
    {d : Person} {act : TraffickingAct} {v : Person} {c : ComplaintText}
    (h : MensReaAsToMeans d act v c) : MensRea1591a d act v c := .means h

theorem mensRea1591a_intro_age
    {d : Person} {act : TraffickingAct} {v : Person} {c : ComplaintText}
    (h : MensReaAsToAge d act v c) : MensRea1591a d act v c := .age h



theorem section1591a_intro
    {d : Person} {ven : Venture} {act : TraffickingAct} {v : Person} {c : ComplaintText}
    (hKnowingly : ActedWithScienter d c)
    (hConduct : Conduct1591a d ven act v c)
    (hMensRea : MensRea1591a d act v c) :
    Section1591a d ven act v c :=
  ⟨hKnowingly, hConduct, hMensRea⟩



theorem effectedByMeans1591b1_intro {d v : Person} {c : ComplaintText}
    (hMeans : MeansOfCompulsion1591 d v c)
    (hEffected : OffenseEffectedByThoseMeans d v c) :
    EffectedByMeans1591b1 d v c :=
  ⟨hMeans, hEffected⟩

theorem aggravator1591b1_intro_effectedByMeans
    {d : Person} {act : TraffickingAct} {v : Person} {c : ComplaintText}
    (h : EffectedByMeans1591b1 d v c) : Aggravator1591b1 d act v c := .effectedByMeans h

theorem aggravator1591b1_intro_victimUnderFourteen
    {d : Person} {act : TraffickingAct} {v : Person} {c : ComplaintText}
    (hAge : VictimUnderFourteen v c)
    (hSubject : VictimSubjectOfEnumeratedActUnderSubsectionB d act v c) :
    Aggravator1591b1 d act v c := .victimUnderFourteen hAge hSubject

theorem section1591b1_intro
    {d : Person} {ven : Venture} {act : TraffickingAct} {v : Person} {c : ComplaintText}
    (hOffense : Section1591a d ven act v c)
    (hAggravator : Aggravator1591b1 d act v c) :
    Section1591b1 d ven act v c :=
  ⟨hOffense, hAggravator⟩

theorem section1591b2_intro
    {d : Person} {ven : Venture} {act : TraffickingAct} {v : Person} {c : ComplaintText}
    (hOffense : Section1591a d ven act v c)
    (hNotSoEffected : ¬ EffectedByMeans1591b1 d v c)
    (hAgeBand : VictimAtLeastFourteenAndUnderEighteen v c)
    (hSubject : VictimSubjectOfEnumeratedActUnderSubsectionB d act v c) :
    Section1591b2 d ven act v c :=
  ⟨hOffense, hNotSoEffected, hAgeBand, hSubject⟩



theorem obstructiveConduct1591d_intro_obstructs
    {d : Person} {oact : ObstructionAct} {c : ComplaintText}
    (h : ObstructsEnforcement d oact c) : ObstructiveConduct1591d d oact c := .obstructs h

theorem obstructiveConduct1591d_intro_attemptsToObstruct
    {d : Person} {oact : ObstructionAct} {c : ComplaintText}
    (h : AttemptsToObstructEnforcement d oact c) :
    ObstructiveConduct1591d d oact c := .attemptsToObstruct h

theorem obstructiveConduct1591d_intro_interferesOrPrevents
    {d : Person} {oact : ObstructionAct} {c : ComplaintText}
    (h : InterferesWithOrPreventsEnforcement d oact c) :
    ObstructiveConduct1591d d oact c := .interferesOrPrevents h

theorem section1591d_intro
    {d : Person} {oact : ObstructionAct} {c : ComplaintText}
    (hConduct : ObstructiveConduct1591d d oact c)
    (hTarget : TargetsEnforcementOfSection1591 oact c) :
    Section1591d d oact c :=
  ⟨hConduct, hTarget⟩

end Proving.USC.T18.Ch77.Part4.Elements
