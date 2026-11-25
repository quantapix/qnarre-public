







import Proving.USC.T18.Ch1.Reslice.Deontic.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch1.Reslice.Deontic

open Proving.USC.Common (Person Entity ComplaintText)











axiom DefinitionScopeApplies (pr : Provision) (c : ComplaintText) : Prop




axiom SectionScopeApplies (pr : Provision) (c : ComplaintText) : Prop







axiom SmtjGroundHolds (g : SmtjGround) (pl : Place) (o : Offense)
    (c : ComplaintText) : Prop





axiom OffenseByOrAgainstUSNational (o : Offense) (c : ComplaintText) : Prop






axiom AddresseeIsPresident (p : Person) (c : ComplaintText) : Prop




axiom ContainsGuanoDeposits (pl : Place) (c : ComplaintText) : Prop





axiom ConsideredAsAppertainingToUS (p : Person) (pl : Place)
    (c : ComplaintText) : Prop







axiom AddresseeAppliesThisTitle (p : Person) (c : ComplaintText) : Prop




axiom ParagraphConflictsWithTreaty (c : ComplaintText) : Prop




axiom DeemedToSupersedeTreaty (p : Person) (c : ComplaintText) : Prop





axiom OffenderDescribedInSection3261a (o : Offense) (c : ComplaintText) : Prop




axiom AppliedParagraph9ToOffense (p : Person) (o : Offense)
    (c : ComplaintText) : Prop







axiom FinancialInstitutionCategoryHolds (k : FinancialInstitutionCategory)
    (e : Entity) (c : ComplaintText) : Prop







axiom AddresseeSeeksToEstablishElement (p : Person) (o : Offense)
    (c : ComplaintText) : Prop





axiom StolenNatureIsElementOfOffense (o : Offense) (pp : Property)
    (c : ComplaintText) : Prop




axiom DefendantKnowledgeOfCharacterIsElement (o : Offense) (pp : Property)
    (c : ComplaintText) : Prop



axiom RepresentationAsToNatureOfProperty (r : Representation) (pp : Property)
    (c : ComplaintText) : Prop





axiom DefendantBelievedPropertyOfSuchCharacter (d : Person) (pp : Property)
    (r : Representation) (c : ComplaintText) : Prop





axiom ElementEstablishedBySubstituteProof (d : Person) (o : Offense)
    (pp : Property) (c : ComplaintText) : Prop






axiom MadeByFederalLawEnforcementOfficer (r : Representation) (p : Person)
    (c : ComplaintText) : Prop




axiom MadeAtDirectionOrWithApprovalOfOfficer (r : Representation) (p : Person)
    (c : ComplaintText) : Prop






axiom ExpresslyProvidedOtherwise (pr : Provision) (c : ComplaintText) : Prop



axiom IsTerritorialDistrictCourt (t : TerritorialDistrictCourt) (ct : Court)
    (c : ComplaintText) : Prop






axiom ViolationOrConspiracyToViolate (o : Offense) (c : ComplaintText) : Prop





axiom PredicateStatuteInUnconditionalList (o : Offense)
    (c : ComplaintText) : Prop






axiom PredicateStatuteInConditionalList (o : Offense)
    (c : ComplaintText) : Prop




axiom RelatesToHealthCareBenefitProgram (o : Offense) (pg : Program)
    (c : ComplaintText) : Prop





axiom IsPublicOrPrivatePlanOrContract (pg : Program) (c : ComplaintText) : Prop



axiom AffectsCommerce (pg : Program) (c : ComplaintText) : Prop




axiom MedicalBenefitItemOrServiceProvided (pg : Program)
    (c : ComplaintText) : Prop





axiom ProvidesMedicalBenefitPayableUnderProgram (e : Entity) (pg : Program)
    (c : ComplaintText) : Prop










axiom smtjNationalityNexus {g : SmtjGround} {pl : Place} {o : Offense}
    {c : ComplaintText} (hGround : SmtjGroundHolds g pl o c)
    (hNeeds : g.requiresNationalityNexus) : OffenseByOrAgainstUSNational o c











axiom paragraph9WithdrawnForSection3261aOffenders {g : SmtjGround} {pl : Place}
    {o : Offense} {c : ComplaintText}
    (hOffender : OffenderDescribedInSection3261a o c)
    (hPara9 : g.isParagraph9) : ¬ SmtjGroundHolds g pl o c

end Proving.USC.T18.Ch1.Reslice.Deontic
