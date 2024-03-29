%#----------------------------------------------------------------------------
%# File: saveasbutton
%#----------------------------------------------------------------------------

%#----------------------------------------------------------------------------
%# dont_list
%#----------------------------------------------------------------------------
<%method dont_list>
<%perl>
  
  # if this method exists, this brick name will not be returned by 
  # HTML::Bricks::get_bricks_list

</%perl>
</%method>

%#----------------------------------------------------------------------------
%# render_edit
%#----------------------------------------------------------------------------
<%method render_edit>

This button displays a link labeled 'save as' which will save all assemblies when
selected.  There is nothing to edit here.

</%method>
 
%#----------------------------------------------------------------------------
%# process
%#----------------------------------------------------------------------------
<%method process>
<%perl>
  my ($rbrick, $rparent_brick, $rroot_brick, $rARGS, $rsub_ARGS, $route_tag, $ruri, $mode, $rredirect) = @_;

  if ($$rARGS{fn} eq 'save_as') {

    my @nexts = $rparent_brick->find(1,'assembly','next');
    my $rnext = shift @nexts;

    return unless defined $rnext;

    my $rassembly = $rnext->get_next();

    return unless defined $rassembly;

    $rassembly->process($rnext, $rroot_brick, { fn => 'save_as' }, $rsub_ARGS, $route_tag, $ruri, $mode, $rredirect);
  }

</%perl>
</%method>

%#----------------------------------------------------------------------------
%# render
%#----------------------------------------------------------------------------
<%method render>
<%perl>
  my ($rbrick, $rparent_brick, $rroot_brick, $rARGS, $rsub_ARGS, $route_tag, $edit_tag, $uri, $mode) = @_;

  my @a = $rparent_brick->find(1,'assembly',undef,undef,'assembly');
  my $rassembly = shift @a;

  if (defined $rassembly->get_next()) {
</%perl>
  <a class="authorbar" href="<% $uri %><% $route_tag %>:fn=save_as">save&nbsp;as</a>
% } else { 
  <span class="authorbar">save&nbsp;as</span>
% }
</%method>
