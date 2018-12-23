import React from 'react';
import { TabContent, TabPane, Nav, NavItem, NavLink, Card, Button, CardTitle, CardText, Row, Col } from 'reactstrap';
import classnames from 'classnames';
import CarsTab from '../MainTabs/carsTab.js';
import OrdersTab from '../MainTabs/ordersTab.js';
import TestDrivesTab from '../MainTabs/testDrivesTab.js';
import ClientsTab from '../MainTabs/clientsTab.js';
import StatisticsTab from '../MainTabs/statisticsTab';

export default class Tabs extends React.Component {
    constructor(props) {
      super(props);
  
      this.toggle = this.toggle.bind(this);
      this.state = {
        activeTab: '1'
      };
    }
  
    toggle(tab) {
      if (this.state.activeTab !== tab) {
        this.setState({
          activeTab: tab
        });
      }
    }
    render() {
      const isAdmin = this.props.userInfo.role === 'Admin';
      const isManager = this.props.userInfo.role === 'Manager';
      return (
        <Col sm="12" style={{alignSelf: "stretch"}}>
          <Nav tabs>
            <NavItem>
              <NavLink
                className={classnames({ active: this.state.activeTab === '1' })}
                onClick={() => { this.toggle('1'); }}
              >
                Cars
              </NavLink>
            </NavItem>
            <NavItem>
              <NavLink
                className={classnames({ active: this.state.activeTab === '2' })}
                onClick={() => { this.toggle('2'); }}
              >
                Orders
              </NavLink>
            </NavItem>
            <NavItem>
              <NavLink
                className={classnames({ active: this.state.activeTab === '3' })}
                onClick={() => { this.toggle('3'); }}
              >
                Test drives
              </NavLink>
            </NavItem>
            { (isAdmin || isManager) && (<>
              <NavItem>
              <NavLink
                className={classnames({ active: this.state.activeTab === '4' })}
                onClick={() => { this.toggle('4'); }}
              >
                Clients
              </NavLink>
            </NavItem>
            <NavItem>
            <NavLink
              className={classnames({ active: this.state.activeTab === '5' })}
              onClick={() => { this.toggle('5'); }}
            >
              Statistics
            </NavLink>
            </NavItem>
            </>)}
          </Nav>
          <TabContent activeTab={this.state.activeTab}>
            <CarsTab userInfo={this.props.userInfo} tabId="1"/>
            <OrdersTab userInfo={this.props.userInfo} tabId="2"/>
            <TestDrivesTab userInfo={this.props.userInfo} tabId="3"/>
            { (isAdmin || isManager) && (<>
            <ClientsTab userInfo={this.props.userInfo} tabId="4" />
            <StatisticsTab tabId = "5" />
            </>)}
          </TabContent>
        </Col>
      );
    }
  }