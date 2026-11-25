









import Proving.USC.T18.Ch1.Reslice.Deontic.Types
import Proving.USC.T18.Ch1.Reslice.Deontic.Predicates
import Proving.USC.T18.Ch1.Reslice.Deontic.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch1.Reslice.Deontic

open Proving.USC.Common (Person Entity ComplaintText)





theorem withinSpecialMaritimeAndTerritorialJurisdiction_intro
    {pl : Place} {o : Offense} {c : ComplaintText} (g : SmtjGround)
    (hGround : SmtjGroundHolds g pl o c) :
    WithinSpecialMaritimeAndTerritorialJurisdiction pl o c :=
  ⟨g, hGround⟩


theorem definition7_intro {pr : Provision} {pl : Place} {o : Offense}
    {c : ComplaintText} (hScope : DefinitionScopeApplies pr c)
    (hExt : WithinSpecialMaritimeAndTerritorialJurisdiction pl o c) :
    Definition7 pr pl o c :=
  ⟨hScope, hExt⟩





theorem power7_4_intro {p : Person} {pl : Place} {c : ComplaintText}
    (hAddr : AddresseeIsPresident p c) (hCond : ContainsGuanoDeposits pl c) :
    Power7_4 p pl c :=
  ⟨hAddr, hCond⟩


theorem power7_4Exercised_intro {p : Person} {pl : Place} {c : ComplaintText}
    (hAddr : AddresseeIsPresident p c) (hCond : ContainsGuanoDeposits pl c)
    (hAct : ConsideredAsAppertainingToUS p pl c) :
    Power7_4Exercised p pl c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩





theorem prohibition7_9Treaty_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeAppliesThisTitle p c)
    (hCond : ParagraphConflictsWithTreaty c) :
    Prohibition7_9Treaty p c :=
  ⟨hAddr, hCond⟩



theorem prohibition7_9TreatyViolated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeAppliesThisTitle p c)
    (hCond : ParagraphConflictsWithTreaty c)
    (hAct : DeemedToSupersedeTreaty p c) :
    Prohibition7_9TreatyViolated p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩



theorem prohibition7_9Section3261a_intro {p : Person} {o : Offense}
    {c : ComplaintText} (hAddr : AddresseeAppliesThisTitle p c)
    (hCond : OffenderDescribedInSection3261a o c) :
    Prohibition7_9Section3261a p o c :=
  ⟨hAddr, hCond⟩



theorem prohibition7_9Section3261aViolated_intro {p : Person} {o : Offense}
    {c : ComplaintText} (hAddr : AddresseeAppliesThisTitle p c)
    (hCond : OffenderDescribedInSection3261a o c)
    (hAct : AppliedParagraph9ToOffense p o c) :
    Prohibition7_9Section3261aViolated p o c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩




theorem isFinancialInstitution_intro {e : Entity} {c : ComplaintText}
    (k : FinancialInstitutionCategory)
    (hCat : FinancialInstitutionCategoryHolds k e c) :
    IsFinancialInstitution e c :=
  ⟨k, hCat⟩


theorem definition20_intro {pr : Provision} {e : Entity} {c : ComplaintText}
    (hScope : DefinitionScopeApplies pr c) (hExt : IsFinancialInstitution e c) :
    Definition20 pr e c :=
  ⟨hScope, hExt⟩




theorem isOfficialRepresentation_intro_ofOfficer {r : Representation}
    {officer : Person} {c : ComplaintText}
    (h : MadeByFederalLawEnforcementOfficer r officer c) :
    IsOfficialRepresentation r officer c :=
  Or.inl h



theorem isOfficialRepresentation_intro_ofDirection {r : Representation}
    {officer : Person} {c : ComplaintText}
    (h : MadeAtDirectionOrWithApprovalOfOfficer r officer c) :
    IsOfficialRepresentation r officer c :=
  Or.inr h


theorem isOfficialRepresentation_intro {r : Representation} {officer : Person}
    {c : ComplaintText}
    (h : MadeByFederalLawEnforcementOfficer r officer c ∨
         MadeAtDirectionOrWithApprovalOfOfficer r officer c) :
    IsOfficialRepresentation r officer c :=
  h


theorem definition21b_intro {pr : Provision} {r : Representation}
    {officer : Person} {c : ComplaintText}
    (hScope : SectionScopeApplies pr c)
    (hExt : IsOfficialRepresentation r officer c) :
    Definition21b pr r officer c :=
  ⟨hScope, hExt⟩




theorem permission21a_intro {p d : Person} {o : Offense} {pp : Property}
    {r : Representation} {c : ComplaintText}
    (hAddr : AddresseeSeeksToEstablishElement p o c)
    (hElem1 : StolenNatureIsElementOfOffense o pp c)
    (hElem2 : DefendantKnowledgeOfCharacterIsElement o pp c)
    (hSubject : RepresentationAsToNatureOfProperty r pp c)
    (hOfficial : ∃ officer : Person, IsOfficialRepresentation r officer c)
    (hBelief : DefendantBelievedPropertyOfSuchCharacter d pp r c) :
    Permission21a p d o pp r c :=
  ⟨hAddr, hElem1, hElem2, hSubject, hOfficial, hBelief⟩



theorem permission21aExercised_intro {p d : Person} {o : Offense}
    {pp : Property} {r : Representation} {c : ComplaintText}
    (hPerm : Permission21a p d o pp r c)
    (hAct : ElementEstablishedBySubstituteProof d o pp c) :
    Permission21aExercised p d o pp r c :=
  ⟨hPerm, hAct⟩





theorem withinCourtOfTheUnitedStates_intro {ct : Court} {c : ComplaintText}
    (t : TerritorialDistrictCourt) (hCourt : IsTerritorialDistrictCourt t ct c) :
    WithinCourtOfTheUnitedStates ct c :=
  ⟨t, hCourt⟩



theorem definition23_intro {pr : Provision} {ct : Court} {c : ComplaintText}
    (hScope : DefinitionScopeApplies pr c)
    (hNoContrary : ¬ ExpresslyProvidedOtherwise pr c)
    (hExt : WithinCourtOfTheUnitedStates ct c) :
    Definition23 pr ct c :=
  ⟨hScope, hNoContrary, hExt⟩




theorem federalHealthCareOffenseBranchHolds_intro_unconditional {o : Offense}
    {pg : Program} {c : ComplaintText}
    (h : PredicateStatuteInUnconditionalList o c) :
    FederalHealthCareOffenseBranchHolds .unconditional o pg c :=
  h



theorem federalHealthCareOffenseBranchHolds_intro_conditional {o : Offense}
    {pg : Program} {c : ComplaintText}
    (hList : PredicateStatuteInConditionalList o c)
    (hRelates : RelatesToHealthCareBenefitProgram o pg c) :
    FederalHealthCareOffenseBranchHolds .conditionalOnHealthCareRelation o pg c :=
  ⟨hList, hRelates⟩



theorem isFederalHealthCareOffense_intro {o : Offense} {pg : Program}
    {c : ComplaintText} (hViolation : ViolationOrConspiracyToViolate o c)
    (b : FederalHealthCareOffenseBranch)
    (hBranch : FederalHealthCareOffenseBranchHolds b o pg c) :
    IsFederalHealthCareOffense o pg c :=
  ⟨hViolation, b, hBranch⟩


theorem definition24a_intro {pr : Provision} {o : Offense} {pg : Program}
    {c : ComplaintText} (hScope : DefinitionScopeApplies pr c)
    (hExt : IsFederalHealthCareOffense o pg c) :
    Definition24a pr o pg c :=
  ⟨hScope, hExt⟩


theorem isHealthCareBenefitPlanOrContract_intro {pg : Program}
    {c : ComplaintText} (hPlan : IsPublicOrPrivatePlanOrContract pg c)
    (hCommerce : AffectsCommerce pg c)
    (hBenefit : MedicalBenefitItemOrServiceProvided pg c) :
    IsHealthCareBenefitPlanOrContract pg c :=
  ⟨hPlan, hCommerce, hBenefit⟩



theorem withinHealthCareBenefitProgramTerm_intro {e : Entity} {pg : Program}
    {c : ComplaintText} (hProgram : IsHealthCareBenefitPlanOrContract pg c)
    (hProvider : ProvidesMedicalBenefitPayableUnderProgram e pg c) :
    WithinHealthCareBenefitProgramTerm e pg c :=
  ⟨hProgram, hProvider⟩


theorem definition24b_intro {pr : Provision} {pg : Program} {c : ComplaintText}
    (hScope : DefinitionScopeApplies pr c)
    (hExt : IsHealthCareBenefitPlanOrContract pg c) :
    Definition24b pr pg c :=
  ⟨hScope, hExt⟩









theorem definitionSmtj7_noDual :
    ¬ carriesNormativeDual Chapter1Norm.definitionSmtj7 :=
  fun h => h rfl


theorem definitionFinancialInstitution20_noDual :
    ¬ carriesNormativeDual Chapter1Norm.definitionFinancialInstitution20 :=
  fun h => h rfl


theorem definitionOfficialRepresentation21b_noDual :
    ¬ carriesNormativeDual Chapter1Norm.definitionOfficialRepresentation21b :=
  fun h => h rfl


theorem definitionCourtOfTheUnitedStates23_noDual :
    ¬ carriesNormativeDual Chapter1Norm.definitionCourtOfTheUnitedStates23 :=
  fun h => h rfl


theorem definitionFederalHealthCareOffense24a_noDual :
    ¬ carriesNormativeDual Chapter1Norm.definitionFederalHealthCareOffense24a :=
  fun h => h rfl


theorem definitionHealthCareBenefitProgram24b_noDual :
    ¬ carriesNormativeDual Chapter1Norm.definitionHealthCareBenefitProgram24b :=
  fun h => h rfl


theorem powerPresidentGuano7_4_carriesDual :
    carriesNormativeDual Chapter1Norm.powerPresidentGuano7_4 :=
  fun h => Modality.noConfusion h


theorem prohibitionTreatySupersession7_9_carriesDual :
    carriesNormativeDual Chapter1Norm.prohibitionTreatySupersession7_9 :=
  fun h => Modality.noConfusion h


theorem prohibitionApplyParagraph9_7_9_carriesDual :
    carriesNormativeDual
      Chapter1Norm.prohibitionApplyParagraph9ToSection3261aOffense7_9 :=
  fun h => Modality.noConfusion h


theorem permissionSubstituteProof21a_carriesDual :
    carriesNormativeDual Chapter1Norm.permissionSubstituteProof21a :=
  fun h => Modality.noConfusion h

end Proving.USC.T18.Ch1.Reslice.Deontic
