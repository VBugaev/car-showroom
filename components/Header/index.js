import React, { Component } from 'react';
import Router from 'next/router';
import {
  Navbar,
  Row,
  NavbarBrand,
  Nav,
  NavItem,
  NavLink
} from 'reactstrap';

import './header.css';
class Header extends Component {
  onSignOutClick = () => {
    localStorage.clear();
    Router.push('/');
  }
  render() {
    const { props } = this;
    return (
      <Row className="header-wrapper">
        <Navbar color="dark" dark expand="md" className="w-100">
          <NavbarBrand href="/">{props.title}</NavbarBrand>
          <Nav className="ml-auto" navbar>
            <NavItem>
              <NavLink href="/login" onClick={this.onSignOutClick}>
                Sign out
          </NavLink>
            </NavItem>
          </Nav>
        </Navbar>
      </Row>
    );
  }
}

export default Header;
