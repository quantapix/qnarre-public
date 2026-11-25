import Proving.USC.T21.Elements.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates








namespace Proving.USC.T21.Elements

open Proving.USC.Common




axiom IsControlledSubstance (s : Substance) (c : ComplaintText) : Prop




axiom IsCounterfeitSubstance (s : Substance) (c : ComplaintText) : Prop



axiom IsListedChemical (s : Substance) (c : ComplaintText) : Prop





axiom ManufacturedSubstance (p : Person) (s : Substance) (c : ComplaintText) : Prop




axiom DistributedSubstance (p : Person) (s : Substance) (c : ComplaintText) : Prop




axiom DispensedSubstance (p : Person) (s : Substance) (c : ComplaintText) : Prop



axiom CreatedSubstance (p : Person) (s : Substance) (c : ComplaintText) : Prop




axiom PossessedSubstance (p : Person) (s : Substance) (c : ComplaintText) : Prop




axiom IntendedToManufacture (p : Person) (s : Substance) (c : ComplaintText) : Prop



axiom IntendedToDistribute (p : Person) (s : Substance) (c : ComplaintText) : Prop



axiom IntendedToDispense (p : Person) (s : Substance) (c : ComplaintText) : Prop





axiom AuthorizedBySubchapter (p : Person) (c : ComplaintText) : Prop




axiom ContainsDrugKind (s : Substance) (k : DrugKind) (c : ComplaintText) : Prop




axiom MixtureQuantityAtLeast (s : Substance) (grams : Nat) (c : ComplaintText) : Prop




axiom PureQuantityAtLeast (s : Substance) (grams : Nat) (c : ComplaintText) : Prop



axiom PlantCountAtLeast (s : Substance) (n : Nat) (c : ComplaintText) : Prop




axiom KnewChemicalWouldBeUsedToManufacture (p : Person) (s : Substance) (c : ComplaintText) : Prop




axiom ReceivedOrDistributedReportableAmountInSmallUnits (p : Person) (s : Substance) (c : ComplaintText) : Prop




axiom IntendedToEvadeRecordkeeping (p : Person) (c : ComplaintText) : Prop




axiom PlacedOrMaintainedBoobytrap (p : Person) (c : ComplaintText) : Prop



axiom SiteIsFederalProperty (c : ComplaintText) : Prop




axiom ControlledSubstanceActivityAtSite (c : ComplaintText) : Prop




axiom KnewRecordkeepingNotAdheredTo (p : Person) (s : Substance) (c : ComplaintText) : Prop




axiom FailedToRemedyViolation (p : Person) (c : ComplaintText) : Prop




axiom IsDateRapeDrug (s : Substance) (c : ComplaintText) : Prop




axiom UsedInternetToDistribute (p : Person) (s : Substance) (c : ComplaintText) : Prop




axiom KnewWouldBeUsedInSexualCrime (p : Person) (s : Substance) (c : ComplaintText) : Prop




axiom KnewBuyerNotAuthorizedPurchaser (p : Person) (s : Substance) (c : ComplaintText) : Prop




axiom AidedOrAbettedInternetDistribution (p : Person) (c : ComplaintText) : Prop






axiom WithinInternetSafeHarbor (p : Person) (c : ComplaintText) : Prop




axiom IntendedToCommitPredicateOffense (p : Person) (c : ComplaintText) : Prop





axiom TookSubstantialStep (p : Person) (c : ComplaintText) : Prop





axiom KnowinglyJoinedAgreement (p : Person) (ag : Agreement) (c : ComplaintText) : Prop




axiom ObjectWasSubchapterOffense (ag : Agreement) (c : ComplaintText) : Prop

end Proving.USC.T21.Elements
