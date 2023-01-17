import React from 'react';
import PropTypes from 'prop-types';
import SandboxController from '../../SandboxController';

export default class IconetFrame extends React.PureComponent {

  static propTypes = {
    contentData: PropTypes.string.isRequired,
  };

  componentDidMount() {
    SandboxController.initialize();
  }

  render() {
    const { contentData } = this.props;

    return (
      <embedded-experience contentData={contentData} />
    );
  }

}
