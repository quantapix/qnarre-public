














import Proving.USC.T18.Ch11.Reslice.Scienter.Types
import Proving.USC.Common.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch11.Reslice.Scienter

open Proving.USC.Common







axiom MentalStateProven (p : Person) (rung : MentalState) (c : ComplaintText) : Prop






axiom ActedCorruptly (p : Person) (c : ComplaintText) : Prop






axiom IntentToCommitTerrorismViaBribery (p : Person) (c : ComplaintText) : Prop






axiom KnewInfluenceUsedForTerrorism (p : Person) (c : ComplaintText) : Prop










def RequiredMentalState201b : MentalState := .Specific



def RequiredMentalState201c : MentalState := .Knowledge

def RequiredMentalState203 : MentalState := .Knowledge


def RequiredMentalState204 : MentalState := .StrictLiability


def RequiredMentalState205 : MentalState := .StrictLiability




def RequiredMentalState207 : MentalState := .Specific


def RequiredMentalState207PendingFact : MentalState := .Negligence


def RequiredMentalState208 : MentalState := .Knowledge


def RequiredMentalState209 : MentalState := .StrictLiability

def RequiredMentalState210 : MentalState := .StrictLiability

def RequiredMentalState211 : MentalState := .StrictLiability



def RequiredMentalState212 : MentalState := .StrictLiability

def RequiredMentalState213 : MentalState := .StrictLiability


def RequiredMentalState214 : MentalState := .StrictLiability

def RequiredMentalState215 : MentalState := .Specific


def RequiredMentalState217 : MentalState := .StrictLiability


def RequiredMentalState219 : MentalState := .StrictLiability


def RequiredMentalState220 : MentalState := .Specific


def RequiredMentalState224 : MentalState := .Knowledge



def RequiredMentalState225 : MentalState := .StrictLiability


def RequiredMentalState226 : MentalState := .Specific


def RequiredMentalState227 : MentalState := .Specific





def WillfulCriminalEnhancement216 : MentalState := .Specific

end Proving.USC.T18.Ch11.Reslice.Scienter
