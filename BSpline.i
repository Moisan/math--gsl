%module "Math::GSL::BSpline"
%{
    #include "gsl/gsl_bspline.h"
    #include "gsl/gsl_vector.h"
%}

%include "gsl/gsl_bspline.h"
%include "gsl/gsl_vector.h"


%perlcode %{
@EXPORT_OK = qw/
               gsl_bspline_alloc 
               gsl_bspline_free 
               gsl_bspline_ncoeffs 
               gsl_bspline_order 
               gsl_bspline_nbreak 
               gsl_bspline_breakpoint 
               gsl_bspline_knots 
               gsl_bspline_knots_uniform 
               gsl_bspline_eval 
             /;
%EXPORT_TAGS = ( all => [ @EXPORT_OK ] );

__END__

=head1 NAME

Math::GSL::BSpline - Functions for the computation of smoothing basis splines

=head1 SYNOPSIS

use Math::GSL::BSpline qw/:all/;

=head1 DESCRIPTION

 Here is a list of all the functions included in this module :

 gsl_bspline_alloc($k, $nbreak) - This function allocates a workspace for computing B-splines of order $k. The number of breakpoints is given by $nbreak. This leads to n = $nbreak + $k - 2 basis functions. Cubic B-splines are specified by $k = 4.
 gsl_bspline_free($w) - This function frees the memory associated with the workspace $w.
 gsl_bspline_ncoeffs($w) - This function returns the number of B-spline coefficients given by n = nbreak + k - 2. 
 gsl_bspline_order 
 gsl_bspline_nbreak 
 gsl_bspline_breakpoint 
 gsl_bspline_knots($breakpts, $w) - This function computes the knots associated with the given breakpoints inside the vector $breakpts and stores them internally in $w->{knots}.
 gsl_bspline_knots_uniform($a, $b, $w) - This function assumes uniformly spaced breakpoints on [$a,$b] and constructs the corresponding knot vector using the previously specified nbreak parameter. The knots are stored in $w->{knots}. 
 gsl_bspline_eval($x, $B, $w) - This function evaluates all B-spline basis functions at the position $x and stores them in the vector $B, so that the ith element of $B is B_i($x). $B must be of length n = $nbreak + $k - 2. This value may also be obtained by calling gsl_bspline_ncoeffs. It is far more efficient to compute all of the basis functions at once than to compute them individually, due to the nature of the defining recurrence relation.

 For more informations on the functions, we refer you to the GSL offcial documentation: 
 http://www.gnu.org/software/gsl/manual/html_node/
 Tip : search on google: site:http://www.gnu.org/software/gsl/manual/html_node/ name_of_the_function_you_want

=head1 EXAMPLES


=head1 AUTHORS

Jonathan Leto <jonathan@leto.net> and Thierry Moisan <thierry.moisan@gmail.com>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2008 Jonathan Leto and Thierry Moisan

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

%}
