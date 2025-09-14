const request = require('supertest');
const app = require('../app');

describe('GET /', () => {
  it('should return 200 status', (done) => {
    request(app)
      .get('/')
      .expect(200)
      .end(done);
  });
});
