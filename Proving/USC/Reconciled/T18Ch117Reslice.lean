















































import Proving.USC.T18.Ch117.Reslice.Elements.Types
import Proving.USC.T18.Ch117.Reslice.Elements.Predicates
import Proving.USC.T18.Ch117.Reslice.Elements.Statute
import Proving.USC.T18.Ch117.Reslice.Elements.Theorems
import Proving.USC.T18.Ch117.Reslice.Deontic.Statute
import Proving.USC.T18.Ch117.Reslice.Deontic.Theorems
import Proving.USC.T18.Ch117.Reslice.Scienter.Statute
import Proving.USC.T18.Ch117.Reslice.Scienter.Theorems
import Proving.USC.T18.Ch117.Reslice.Bridge

set_option autoImplicit false

namespace Proving.USC.Reconciled

open Proving.USC.Common





abbrev Section2421Aa := @Proving.USC.T18.Ch117.Reslice.Elements.Section2421Aa



abbrev Section2421Ab := @Proving.USC.T18.Ch117.Reslice.Elements.Section2421Ab


abbrev ValidSection2421ACharge := @Proving.USC.T18.Ch117.Reslice.Elements.ValidSection2421ACharge


abbrev ValidSection2421ACivilClaim :=
  @Proving.USC.T18.Ch117.Reslice.Elements.ValidSection2421ACivilClaim


abbrev Section2421ARestitutionMandate :=
  @Proving.USC.T18.Ch117.Reslice.Elements.Section2421ARestitutionMandate




abbrev Section2423a := @Proving.USC.T18.Ch117.Reslice.Elements.Section2423a

abbrev Section2423b := @Proving.USC.T18.Ch117.Reslice.Elements.Section2423b

abbrev Section2423c := @Proving.USC.T18.Ch117.Reslice.Elements.Section2423c

abbrev Section2423d := @Proving.USC.T18.Ch117.Reslice.Elements.Section2423d

abbrev Section2423e := @Proving.USC.T18.Ch117.Reslice.Elements.Section2423e

abbrev Section2423f := @Proving.USC.T18.Ch117.Reslice.Elements.Section2423f

abbrev EngagesInIllicitSexualConduct :=
  @Proving.USC.T18.Ch117.Reslice.Elements.EngagesInIllicitSexualConduct

abbrev ValidSection2423Charge := @Proving.USC.T18.Ch117.Reslice.Elements.ValidSection2423Charge








section Witnesses
open Proving.USC.T18.Ch117.Reslice.Bridge


#check @s2421Aa_elements_implies_deontic
#check @s2421Ab_elements_implies_deontic
#check @s2421Aa_elements_implies_scienter
#check @s2421Ab1_elements_implies_scienter
#check @s2421Ab2_elements_implies_scienter
#check @s2421Aa_deontic_implies_scienter
#check @s2421Ab1_deontic_implies_scienter


#check @s2423a_elements_implies_deontic
#check @s2423b_elements_implies_deontic
#check @s2423c_elements_implies_deontic
#check @s2423d_elements_implies_deontic
#check @s2423e_elements_implies_deontic
#check @s2423a_elements_implies_scienter
#check @s2423b_elements_implies_scienter
#check @s2423c_elements_implies_scienter
#check @s2423d_elements_implies_scienter
#check @s2423e_elements_implies_scienter
#check @s2423a_deontic_implies_scienter
#check @s2423b_deontic_implies_scienter
#check @s2423c_deontic_implies_scienter
#check @s2423d_deontic_implies_scienter
#check @s2423e_deontic_implies_scienter


#check @Golden.s2423a_implies_racketeering
#check @Golden.s2423b_implies_racketeering
#check @Golden.s2423c_implies_racketeering
#check @Golden.s2423d_implies_racketeering
#check @Golden.s2423e_implies_racketeering


#check @coveredTraveler_elements_implies_ontology
#check @s2421Ac_elements_implies_procedure_modulo_gaps
end Witnesses

end Proving.USC.Reconciled
