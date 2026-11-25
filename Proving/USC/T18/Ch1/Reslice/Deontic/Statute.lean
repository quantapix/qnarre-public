













import Proving.USC.T18.Ch1.Reslice.Deontic.Types
import Proving.USC.T18.Ch1.Reslice.Deontic.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch1.Reslice.Deontic

open Proving.USC.Common (Person Entity ComplaintText)




def modalityOf : Chapter1Norm → Modality
  | .definitionSmtj7 => .definition
  | .powerPresidentGuano7_4 => .power
  | .prohibitionTreatySupersession7_9 => .prohibition
  | .prohibitionApplyParagraph9ToSection3261aOffense7_9 => .prohibition
  | .definitionFinancialInstitution20 => .definition
  | .permissionSubstituteProof21a => .permission
  | .definitionOfficialRepresentation21b => .definition
  | .definitionCourtOfTheUnitedStates23 => .definition
  | .definitionFederalHealthCareOffense24a => .definition
  | .definitionHealthCareBenefitProgram24b => .definition




def carriesNormativeDual (n : Chapter1Norm) : Prop :=
  modalityOf n ≠ Modality.definition







def WithinSpecialMaritimeAndTerritorialJurisdiction (pl : Place) (o : Offense)
    (c : ComplaintText) : Prop :=
  ∃ g : SmtjGround, SmtjGroundHolds g pl o c



structure Definition7 (pr : Provision) (pl : Place) (o : Offense)
    (c : ComplaintText) : Prop where
  scope : DefinitionScopeApplies pr c
  extension : WithinSpecialMaritimeAndTerritorialJurisdiction pl o c





structure Power7_4 (p : Person) (pl : Place) (c : ComplaintText) : Prop where
  addressee : AddresseeIsPresident p c
  condition : ContainsGuanoDeposits pl c




def Power7_4Exercised (p : Person) (pl : Place) (c : ComplaintText) : Prop :=
  Power7_4 p pl c ∧ ConsideredAsAppertainingToUS p pl c







structure Prohibition7_9Treaty (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeAppliesThisTitle p c
  condition : ParagraphConflictsWithTreaty c




def Prohibition7_9TreatyViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition7_9Treaty p c ∧ DeemedToSupersedeTreaty p c





structure Prohibition7_9Section3261a (p : Person) (o : Offense)
    (c : ComplaintText) : Prop where
  addressee : AddresseeAppliesThisTitle p c
  condition : OffenderDescribedInSection3261a o c







def Prohibition7_9Section3261aViolated (p : Person) (o : Offense)
    (c : ComplaintText) : Prop :=
  Prohibition7_9Section3261a p o c ∧ AppliedParagraph9ToOffense p o c





def IsFinancialInstitution (e : Entity) (c : ComplaintText) : Prop :=
  ∃ k : FinancialInstitutionCategory, FinancialInstitutionCategoryHolds k e c


structure Definition20 (pr : Provision) (e : Entity) (c : ComplaintText) : Prop where
  scope : DefinitionScopeApplies pr c
  extension : IsFinancialInstitution e c






def IsOfficialRepresentation (r : Representation) (officer : Person)
    (c : ComplaintText) : Prop :=
  MadeByFederalLawEnforcementOfficer r officer c ∨
    MadeAtDirectionOrWithApprovalOfOfficer r officer c



structure Definition21b (pr : Provision) (r : Representation) (officer : Person)
    (c : ComplaintText) : Prop where
  scope : SectionScopeApplies pr c
  extension : IsOfficialRepresentation r officer c









structure Permission21a (p : Person) (d : Person) (o : Offense) (pp : Property)
    (r : Representation) (c : ComplaintText) : Prop where
  addressee : AddresseeSeeksToEstablishElement p o c
  stolenNatureElement : StolenNatureIsElementOfOffense o pp c
  knowledgeElement : DefendantKnowledgeOfCharacterIsElement o pp c
  representationSubject : RepresentationAsToNatureOfProperty r pp c
  representationOfficial : ∃ officer : Person, IsOfficialRepresentation r officer c
  belief : DefendantBelievedPropertyOfSuchCharacter d pp r c





def Permission21aExercised (p : Person) (d : Person) (o : Offense)
    (pp : Property) (r : Representation) (c : ComplaintText) : Prop :=
  Permission21a p d o pp r c ∧ ElementEstablishedBySubstituteProof d o pp c






def WithinCourtOfTheUnitedStates (ct : Court) (c : ComplaintText) : Prop :=
  ∃ t : TerritorialDistrictCourt, IsTerritorialDistrictCourt t ct c





structure Definition23 (pr : Provision) (ct : Court) (c : ComplaintText) : Prop where
  scope : DefinitionScopeApplies pr c
  noContraryProvision : ¬ ExpresslyProvidedOtherwise pr c
  extension : WithinCourtOfTheUnitedStates ct c







def FederalHealthCareOffenseBranchHolds :
    FederalHealthCareOffenseBranch → Offense → Program → ComplaintText → Prop
  | .unconditional, o, _, c => PredicateStatuteInUnconditionalList o c
  | .conditionalOnHealthCareRelation, o, pg, c =>
      PredicateStatuteInConditionalList o c ∧ RelatesToHealthCareBenefitProgram o pg c




def IsFederalHealthCareOffense (o : Offense) (pg : Program)
    (c : ComplaintText) : Prop :=
  ViolationOrConspiracyToViolate o c ∧
    ∃ b : FederalHealthCareOffenseBranch, FederalHealthCareOffenseBranchHolds b o pg c


structure Definition24a (pr : Provision) (o : Offense) (pg : Program)
    (c : ComplaintText) : Prop where
  scope : DefinitionScopeApplies pr c
  extension : IsFederalHealthCareOffense o pg c





def IsHealthCareBenefitPlanOrContract (pg : Program) (c : ComplaintText) : Prop :=
  IsPublicOrPrivatePlanOrContract pg c ∧ AffectsCommerce pg c ∧
    MedicalBenefitItemOrServiceProvided pg c





def WithinHealthCareBenefitProgramTerm (e : Entity) (pg : Program)
    (c : ComplaintText) : Prop :=
  IsHealthCareBenefitPlanOrContract pg c ∧
    ProvidesMedicalBenefitPayableUnderProgram e pg c


structure Definition24b (pr : Provision) (pg : Program) (c : ComplaintText) : Prop where
  scope : DefinitionScopeApplies pr c
  extension : IsHealthCareBenefitPlanOrContract pg c

end Proving.USC.T18.Ch1.Reslice.Deontic
