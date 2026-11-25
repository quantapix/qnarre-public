
















import Proving.USC.T18.PredicateDefs.Deontic.Types
import Proving.USC.T18.PredicateDefs.Deontic.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.PredicateDefs.Deontic

open Proving.USC.Common





structure Definition20 (o : DefinedObject) (c : ComplaintText) : Prop where
  modality : ClauseHasModality Modality.Definition c



def FinancialInstitutionApplies20 (o : DefinedObject) (c : ComplaintText) : Prop :=
  Definition20 o c ∧ IsFinancialInstitution o c




structure Definition1346 (p : Person) (c : ComplaintText) : Prop where
  modality : ClauseHasModality Modality.Definition c




def SchemeToDefraudApplies1346 (p : Person) (c : ComplaintText) : Prop :=
  Definition1346 p c ∧ DevisedSchemeToDefraud p c



def HonestServicesApplies1346 (p : Person) (c : ComplaintText) : Prop :=
  SchemeToDefraudApplies1346 p c ∧ DeprivesHonestServices p c





def OfficialProceedingApplies1515a (o : DefinedObject) (c : ComplaintText) : Prop :=
  ClauseHasModality Modality.Definition c ∧ IsOfficialProceeding o c





structure Permission1515c (p : Person) (c : ComplaintText) : Prop where
  modality  : ClauseHasModality Modality.Permission c
  condition : RepresentationLawfulBonaFide p c




def PermissionExercised1515c (p : Person) (c : ComplaintText) : Prop :=
  Permission1515c p c ∧ ProvidedRepresentationServices p c

end Proving.USC.T18.PredicateDefs.Deontic
